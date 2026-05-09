; DESCRIPTION: Renders a black line between points (173, 69) and (461, 202).
; PLAN: r0=173(x1), r1=69(y1), r2=461(x2), r3=202(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 69
LDI r2, 461
LDI r3, 202
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
