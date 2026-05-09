; DESCRIPTION: Composite: Sets a single yellow pixel at (176, 123) then Renders a magenta disk with center (180, 50) and radius 29 then Draws a cyan line from (300, 63) to (473, 203).
; PLAN: r0=176(x), r1=123(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=180(x), r6=50(y), r7=29(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=300(x1), r11=63(y1), r12=473(x2), r13=203(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 176
LDI r1, 123
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 180
LDI r6, 50
LDI r7, 29
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 300
LDI r11, 63
LDI r12, 473
LDI r13, 203
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
