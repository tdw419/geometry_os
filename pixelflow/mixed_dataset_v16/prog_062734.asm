; DESCRIPTION: Composite: Draws a blue line from (28, 224) to (352, 47) then Renders a magenta disk with center (149, 132) and radius 26.
; PLAN: r0=28(x1), r1=224(y1), r2=352(x2), r3=47(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=149(x), r6=132(y), r7=26(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 28
LDI r1, 224
LDI r2, 352
LDI r3, 47
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 132
LDI r7, 26
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
