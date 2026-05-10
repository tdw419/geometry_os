; DESCRIPTION: Places a magenta 69x12 rectangle at position (405, 173).
; PLAN: r0=405(x), r1=173(y), r2=69(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 173
LDI r2, 69
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
