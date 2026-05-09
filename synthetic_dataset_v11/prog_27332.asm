; DESCRIPTION: Renders a green line between points (5, 120) and (63, 164).
; PLAN: r0=5(x1), r1=120(y1), r2=63(x2), r3=164(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 120
LDI r2, 63
LDI r3, 164
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
