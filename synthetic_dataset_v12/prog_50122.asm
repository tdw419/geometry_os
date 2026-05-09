; DESCRIPTION: Places a magenta 69x35 rectangle at position (173, 165).
; PLAN: r0=173(x), r1=165(y), r2=69(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 165
LDI r2, 69
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
