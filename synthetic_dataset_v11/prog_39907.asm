; DESCRIPTION: Renders a blue line between points (252, 228) and (204, 128).
; PLAN: r0=252(x1), r1=228(y1), r2=204(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 228
LDI r2, 204
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
