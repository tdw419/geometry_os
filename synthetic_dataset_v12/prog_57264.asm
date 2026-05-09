; DESCRIPTION: Places a magenta 109x53 rectangle at position (210, 103).
; PLAN: r0=210(x), r1=103(y), r2=109(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 103
LDI r2, 109
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
