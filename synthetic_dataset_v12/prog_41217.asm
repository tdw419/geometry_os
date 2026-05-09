; DESCRIPTION: Places a purple 108x119 rectangle at position (340, 36).
; PLAN: r0=340(x), r1=36(y), r2=108(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 36
LDI r2, 108
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
