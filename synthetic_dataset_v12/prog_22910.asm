; DESCRIPTION: Places a purple 44x25 rectangle at position (107, 212).
; PLAN: r0=107(x), r1=212(y), r2=44(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 212
LDI r2, 44
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
