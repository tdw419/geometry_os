; DESCRIPTION: Places a magenta 53x103 rectangle at position (370, 28).
; PLAN: r0=370(x), r1=28(y), r2=53(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 28
LDI r2, 53
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
