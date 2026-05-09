; DESCRIPTION: Places a purple 38x108 rectangle at position (446, 74).
; PLAN: r0=446(x), r1=74(y), r2=38(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 74
LDI r2, 38
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
