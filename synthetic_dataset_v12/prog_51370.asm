; DESCRIPTION: Renders a black line between points (27, 93) and (138, 33).
; PLAN: r0=27(x1), r1=93(y1), r2=138(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 93
LDI r2, 138
LDI r3, 33
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
