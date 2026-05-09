; DESCRIPTION: Places a blue line segment connecting (134, 255) to (228, 246).
; PLAN: r0=134(x1), r1=255(y1), r2=228(x2), r3=246(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 255
LDI r2, 228
LDI r3, 246
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
