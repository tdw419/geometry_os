; DESCRIPTION: Renders a blue line between points (148, 173) and (253, 213).
; PLAN: r0=148(x1), r1=173(y1), r2=253(x2), r3=213(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 173
LDI r2, 253
LDI r3, 213
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
