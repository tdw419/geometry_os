; DESCRIPTION: Renders a red line between points (210, 128) and (191, 50).
; PLAN: r0=210(x1), r1=128(y1), r2=191(x2), r3=50(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 128
LDI r2, 191
LDI r3, 50
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
