; DESCRIPTION: Places a magenta 91x55 rectangle at position (33, 113).
; PLAN: r0=33(x), r1=113(y), r2=91(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 113
LDI r2, 91
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
