; DESCRIPTION: Renders a white line between points (336, 128) and (273, 210).
; PLAN: r0=336(x1), r1=128(y1), r2=273(x2), r3=210(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 128
LDI r2, 273
LDI r3, 210
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
