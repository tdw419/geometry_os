; DESCRIPTION: Places a blue 70x74 rectangle at position (88, 182).
; PLAN: r0=88(x), r1=182(y), r2=70(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 182
LDI r2, 70
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
