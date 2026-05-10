; DESCRIPTION: Renders a black line between points (384, 69) and (16, 184).
; PLAN: r0=384(x1), r1=69(y1), r2=16(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 69
LDI r2, 16
LDI r3, 184
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
