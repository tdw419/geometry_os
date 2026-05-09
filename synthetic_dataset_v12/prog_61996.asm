; DESCRIPTION: Renders a green line between points (210, 253) and (252, 241).
; PLAN: r0=210(x1), r1=253(y1), r2=252(x2), r3=241(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 253
LDI r2, 252
LDI r3, 241
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
