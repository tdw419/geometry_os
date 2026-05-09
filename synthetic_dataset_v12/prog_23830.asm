; DESCRIPTION: Renders a black line between points (305, 202) and (476, 95).
; PLAN: r0=305(x1), r1=202(y1), r2=476(x2), r3=95(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 202
LDI r2, 476
LDI r3, 95
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
