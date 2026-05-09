; DESCRIPTION: Places a purple line segment connecting (365, 26) to (210, 228).
; PLAN: r0=365(x1), r1=26(y1), r2=210(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 26
LDI r2, 210
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
