; DESCRIPTION: Places a purple 21x75 rectangle at position (423, 169).
; PLAN: r0=423(x), r1=169(y), r2=21(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 169
LDI r2, 21
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
