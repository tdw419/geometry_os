; DESCRIPTION: Renders a white line between points (439, 168) and (342, 60).
; PLAN: r0=439(x1), r1=168(y1), r2=342(x2), r3=60(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 168
LDI r2, 342
LDI r3, 60
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
