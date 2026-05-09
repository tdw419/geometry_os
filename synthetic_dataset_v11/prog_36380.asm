; DESCRIPTION: Renders a white line between points (124, 235) and (178, 166).
; PLAN: r0=124(x1), r1=235(y1), r2=178(x2), r3=166(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 235
LDI r2, 178
LDI r3, 166
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
