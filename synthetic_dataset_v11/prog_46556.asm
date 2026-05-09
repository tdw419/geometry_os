; DESCRIPTION: Renders a white line between points (64, 229) and (230, 87).
; PLAN: r0=64(x1), r1=229(y1), r2=230(x2), r3=87(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 229
LDI r2, 230
LDI r3, 87
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
