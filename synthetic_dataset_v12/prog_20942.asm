; DESCRIPTION: Places a magenta 89x53 rectangle at position (198, 70).
; PLAN: r0=198(x), r1=70(y), r2=89(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 70
LDI r2, 89
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
