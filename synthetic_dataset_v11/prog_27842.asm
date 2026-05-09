; DESCRIPTION: Places a magenta 99x80 rectangle at position (123, 135).
; PLAN: r0=123(x), r1=135(y), r2=99(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 135
LDI r2, 99
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
