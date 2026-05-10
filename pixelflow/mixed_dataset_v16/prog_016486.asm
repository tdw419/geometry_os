; DESCRIPTION: Renders a white line between points (138, 195) and (263, 131).
; PLAN: r0=138(x1), r1=195(y1), r2=263(x2), r3=131(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 195
LDI r2, 263
LDI r3, 131
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
