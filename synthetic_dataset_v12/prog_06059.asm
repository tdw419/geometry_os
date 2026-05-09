; DESCRIPTION: Renders a black line between points (243, 52) and (161, 126).
; PLAN: r0=243(x1), r1=52(y1), r2=161(x2), r3=126(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 52
LDI r2, 161
LDI r3, 126
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
