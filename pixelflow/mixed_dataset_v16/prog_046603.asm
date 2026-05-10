; DESCRIPTION: Renders a blue line between points (433, 222) and (26, 228).
; PLAN: r0=433(x1), r1=222(y1), r2=26(x2), r3=228(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 222
LDI r2, 26
LDI r3, 228
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
