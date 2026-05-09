; DESCRIPTION: Renders a green line between points (355, 128) and (388, 204).
; PLAN: r0=355(x1), r1=128(y1), r2=388(x2), r3=204(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 128
LDI r2, 388
LDI r3, 204
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
