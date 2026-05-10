; DESCRIPTION: Places a purple 40x29 rectangle at position (340, 67).
; PLAN: r0=340(x), r1=67(y), r2=40(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 67
LDI r2, 40
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
