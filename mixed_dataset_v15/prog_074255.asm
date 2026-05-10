; DESCRIPTION: Renders a white line between points (235, 54) and (398, 187).
; PLAN: r0=235(x1), r1=54(y1), r2=398(x2), r3=187(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 54
LDI r2, 398
LDI r3, 187
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
