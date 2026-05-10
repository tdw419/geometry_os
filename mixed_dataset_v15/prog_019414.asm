; DESCRIPTION: Places a purple line segment connecting (42, 197) to (472, 210).
; PLAN: r0=42(x1), r1=197(y1), r2=472(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 197
LDI r2, 472
LDI r3, 210
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
