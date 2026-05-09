; DESCRIPTION: Renders a green line between points (265, 49) and (429, 204).
; PLAN: r0=265(x1), r1=49(y1), r2=429(x2), r3=204(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 49
LDI r2, 429
LDI r3, 204
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
