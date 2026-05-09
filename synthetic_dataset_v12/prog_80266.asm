; DESCRIPTION: Renders a white line between points (171, 91) and (189, 199).
; PLAN: r0=171(x1), r1=91(y1), r2=189(x2), r3=199(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 91
LDI r2, 189
LDI r3, 199
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
