; DESCRIPTION: Renders a red line between points (503, 140) and (220, 128).
; PLAN: r0=503(x1), r1=140(y1), r2=220(x2), r3=128(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 140
LDI r2, 220
LDI r3, 128
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
