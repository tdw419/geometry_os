; DESCRIPTION: Places a purple line segment connecting (64, 228) to (243, 199).
; PLAN: r0=64(x1), r1=228(y1), r2=243(x2), r3=199(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 228
LDI r2, 243
LDI r3, 199
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
