; DESCRIPTION: Renders a white line between points (402, 67) and (282, 204).
; PLAN: r0=402(x1), r1=67(y1), r2=282(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 67
LDI r2, 282
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
