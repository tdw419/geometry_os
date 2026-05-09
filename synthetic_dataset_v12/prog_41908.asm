; DESCRIPTION: Places a purple 90x47 rectangle at position (105, 193).
; PLAN: r0=105(x), r1=193(y), r2=90(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 193
LDI r2, 90
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
