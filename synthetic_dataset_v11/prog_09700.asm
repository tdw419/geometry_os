; DESCRIPTION: Renders a green line between points (139, 107) and (173, 184).
; PLAN: r0=139(x1), r1=107(y1), r2=173(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 107
LDI r2, 173
LDI r3, 184
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
