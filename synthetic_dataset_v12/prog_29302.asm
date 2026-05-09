; DESCRIPTION: Places a purple 14x95 rectangle at position (108, 108).
; PLAN: r0=108(x), r1=108(y), r2=14(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 108
LDI r2, 14
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
