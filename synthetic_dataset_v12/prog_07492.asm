; DESCRIPTION: Renders a black line between points (317, 175) and (401, 156).
; PLAN: r0=317(x1), r1=175(y1), r2=401(x2), r3=156(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 175
LDI r2, 401
LDI r3, 156
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
