; DESCRIPTION: Places a magenta 80x113 rectangle at position (5, 123).
; PLAN: r0=5(x), r1=123(y), r2=80(width), r3=113(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 123
LDI r2, 80
LDI r3, 113
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
