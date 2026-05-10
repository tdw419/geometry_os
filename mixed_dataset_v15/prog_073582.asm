; DESCRIPTION: Renders a white line segment connecting (317, 161) to (257, 48).
; PLAN: r0=317(x1), r1=161(y1), r2=257(x2), r3=48(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 161
LDI r2, 257
LDI r3, 48
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
