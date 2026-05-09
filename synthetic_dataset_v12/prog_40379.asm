; DESCRIPTION: Renders a white line between points (290, 176) and (287, 50).
; PLAN: r0=290(x1), r1=176(y1), r2=287(x2), r3=50(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 176
LDI r2, 287
LDI r3, 50
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
