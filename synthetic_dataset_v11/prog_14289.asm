; DESCRIPTION: Places a blue 108x117 rectangle at position (74, 38).
; PLAN: r0=74(x), r1=38(y), r2=108(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 38
LDI r2, 108
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
