; DESCRIPTION: Renders a white line between points (245, 10) and (207, 34).
; PLAN: r0=245(x1), r1=10(y1), r2=207(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 10
LDI r2, 207
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
