; DESCRIPTION: Renders a magenta line between points (284, 155) and (507, 83).
; PLAN: r0=284(x1), r1=155(y1), r2=507(x2), r3=83(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 155
LDI r2, 507
LDI r3, 83
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
