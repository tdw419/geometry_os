; DESCRIPTION: Places a magenta 112x53 rectangle at position (14, 40).
; PLAN: r0=14(x), r1=40(y), r2=112(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 40
LDI r2, 112
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
