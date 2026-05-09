; DESCRIPTION: Renders a white line between points (254, 195) and (345, 168).
; PLAN: r0=254(x1), r1=195(y1), r2=345(x2), r3=168(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 195
LDI r2, 345
LDI r3, 168
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
