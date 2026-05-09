; DESCRIPTION: Renders a black line between points (46, 168) and (307, 77).
; PLAN: r0=46(x1), r1=168(y1), r2=307(x2), r3=77(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 168
LDI r2, 307
LDI r3, 77
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
