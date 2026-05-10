; DESCRIPTION: Renders a green line between points (42, 188) and (500, 120).
; PLAN: r0=42(x1), r1=188(y1), r2=500(x2), r3=120(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 188
LDI r2, 500
LDI r3, 120
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
