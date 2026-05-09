; DESCRIPTION: Renders a black line between points (206, 222) and (228, 163).
; PLAN: r0=206(x1), r1=222(y1), r2=228(x2), r3=163(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 222
LDI r2, 228
LDI r3, 163
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
