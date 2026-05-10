; DESCRIPTION: Composite: Draws a cyan line from (142, 123) to (353, 39) then Places a green dot at position (314, 52) then Draws a magenta circle centered at (406, 64) with radius 61.
; PLAN: r0=142(x1), r1=123(y1), r2=353(x2), r3=39(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=314(x), r6=52(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=406(x), r11=64(y), r12=61(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 142
LDI r1, 123
LDI r2, 353
LDI r3, 39
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 52
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 406
LDI r11, 64
LDI r12, 61
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
