; DESCRIPTION: Places a purple line segment connecting (467, 221) to (299, 29).
; PLAN: r0=467(x1), r1=221(y1), r2=299(x2), r3=29(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 221
LDI r2, 299
LDI r3, 29
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
