; DESCRIPTION: Renders a red line between points (164, 211) and (154, 50).
; PLAN: r0=164(x1), r1=211(y1), r2=154(x2), r3=50(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 211
LDI r2, 154
LDI r3, 50
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
