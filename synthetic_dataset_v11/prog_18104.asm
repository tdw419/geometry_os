; DESCRIPTION: Renders a green line between points (218, 204) and (253, 214).
; PLAN: r0=218(x1), r1=204(y1), r2=253(x2), r3=214(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 204
LDI r2, 253
LDI r3, 214
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
