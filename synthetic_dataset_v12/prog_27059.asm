; DESCRIPTION: Places a purple 38x67 rectangle at position (217, 29).
; PLAN: r0=217(x), r1=29(y), r2=38(width), r3=67(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 29
LDI r2, 38
LDI r3, 67
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
