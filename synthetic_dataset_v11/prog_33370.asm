; DESCRIPTION: Renders a white line between points (15, 27) and (187, 227).
; PLAN: r0=15(x1), r1=27(y1), r2=187(x2), r3=227(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 27
LDI r2, 187
LDI r3, 227
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
