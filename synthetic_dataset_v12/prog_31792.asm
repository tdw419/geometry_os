; DESCRIPTION: Renders a white line between points (100, 197) and (193, 19).
; PLAN: r0=100(x1), r1=197(y1), r2=193(x2), r3=19(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 197
LDI r2, 193
LDI r3, 19
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
