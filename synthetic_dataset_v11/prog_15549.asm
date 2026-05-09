; DESCRIPTION: Places a blue line segment connecting (81, 65) to (186, 228).
; PLAN: r0=81(x1), r1=65(y1), r2=186(x2), r3=228(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 65
LDI r2, 186
LDI r3, 228
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
