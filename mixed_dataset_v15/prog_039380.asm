; DESCRIPTION: Composite: Draws a green line from (154, 113) to (212, 32) then Sets a single cyan pixel at (490, 2) then Creates a cyan rectangular region at (16, 86) spanning 37 by 47 pixels.
; PLAN: r0=154(x1), r1=113(y1), r2=212(x2), r3=32(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=490(x), r6=2(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=16(x), r11=86(y), r12=37(width), r13=47(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 154
LDI r1, 113
LDI r2, 212
LDI r3, 32
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 490
LDI r6, 2
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 16
LDI r11, 86
LDI r12, 37
LDI r13, 47
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
