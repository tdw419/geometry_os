; DESCRIPTION: Places a purple 39x75 rectangle at position (94, 12).
; PLAN: r0=94(x), r1=12(y), r2=39(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 12
LDI r2, 39
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
