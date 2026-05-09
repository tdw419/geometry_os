; DESCRIPTION: Places a magenta 108x74 rectangle at position (287, 180).
; PLAN: r0=287(x), r1=180(y), r2=108(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 180
LDI r2, 108
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
