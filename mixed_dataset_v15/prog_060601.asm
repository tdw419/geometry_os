; DESCRIPTION: Composite: Creates a magenta rectangular region at (160, 11) spanning 43 by 54 pixels then Draws a green line from (210, 223) to (275, 32) then Places a purple dot at position (29, 89).
; PLAN: r0=160(x), r1=11(y), r2=43(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=210(x1), r6=223(y1), r7=275(x2), r8=32(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=29(x), r11=89(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 160
LDI r1, 11
LDI r2, 43
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 210
LDI r6, 223
LDI r7, 275
LDI r8, 32
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 29
LDI r11, 89
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
