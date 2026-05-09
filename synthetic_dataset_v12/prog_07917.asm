; DESCRIPTION: Renders a black line between points (210, 116) and (107, 162).
; PLAN: r0=210(x1), r1=116(y1), r2=107(x2), r3=162(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 116
LDI r2, 107
LDI r3, 162
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
