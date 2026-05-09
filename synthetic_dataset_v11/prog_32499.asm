; DESCRIPTION: Places a magenta 71x15 rectangle at position (33, 113).
; PLAN: r0=33(x), r1=113(y), r2=71(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 113
LDI r2, 71
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
