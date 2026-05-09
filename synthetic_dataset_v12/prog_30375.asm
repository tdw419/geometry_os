; DESCRIPTION: Composite: Draws a white circle centered at (453, 96) with radius 15 then Renders a blue line between points (67, 220) and (255, 244).
; PLAN: r0=453(x), r1=96(y), r2=15(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=67(x1), r6=220(y1), r7=255(x2), r8=244(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 453
LDI r1, 96
LDI r2, 15
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 67
LDI r6, 220
LDI r7, 255
LDI r8, 244
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
