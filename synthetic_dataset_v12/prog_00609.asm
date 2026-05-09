; DESCRIPTION: Renders a white line between points (281, 2) and (208, 120).
; PLAN: r0=281(x1), r1=2(y1), r2=208(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 2
LDI r2, 208
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
