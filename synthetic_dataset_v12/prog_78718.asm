; DESCRIPTION: Places a magenta 69x61 rectangle at position (288, 14).
; PLAN: r0=288(x), r1=14(y), r2=69(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 14
LDI r2, 69
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
