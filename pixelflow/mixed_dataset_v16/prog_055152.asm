; DESCRIPTION: Composite: Renders a blue line between points (142, 12) and (401, 128) then Draws a white circle centered at (240, 188) with radius 48.
; PLAN: r0=142(x1), r1=12(y1), r2=401(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=240(x), r6=188(y), r7=48(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 142
LDI r1, 12
LDI r2, 401
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 188
LDI r7, 48
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
