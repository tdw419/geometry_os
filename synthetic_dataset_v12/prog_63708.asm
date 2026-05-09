; DESCRIPTION: Renders a black line between points (433, 30) and (167, 177).
; PLAN: r0=433(x1), r1=30(y1), r2=167(x2), r3=177(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 30
LDI r2, 167
LDI r3, 177
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
