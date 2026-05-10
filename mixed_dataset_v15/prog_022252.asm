; DESCRIPTION: Places a magenta 105x99 rectangle at position (305, 123).
; PLAN: r0=305(x), r1=123(y), r2=105(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 123
LDI r2, 105
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
