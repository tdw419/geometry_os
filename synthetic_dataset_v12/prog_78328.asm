; DESCRIPTION: Composite: Draws a magenta rectangle at (130, 51) with width 10 and height 87 then Sets a single white pixel at (37, 67) then Renders a cyan line between points (190, 72) and (13, 187).
; PLAN: r0=130(x), r1=51(y), r2=10(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=37(x), r6=67(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=190(x1), r11=72(y1), r12=13(x2), r13=187(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 130
LDI r1, 51
LDI r2, 10
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 37
LDI r6, 67
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 190
LDI r11, 72
LDI r12, 13
LDI r13, 187
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
