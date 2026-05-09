; DESCRIPTION: Places a magenta 38x29 rectangle at position (287, 70).
; PLAN: r0=287(x), r1=70(y), r2=38(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 70
LDI r2, 38
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
