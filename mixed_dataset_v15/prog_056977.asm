; DESCRIPTION: Renders a white line between points (463, 206) and (294, 51).
; PLAN: r0=463(x1), r1=206(y1), r2=294(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 206
LDI r2, 294
LDI r3, 51
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
