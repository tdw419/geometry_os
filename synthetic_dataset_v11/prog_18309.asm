; DESCRIPTION: Places a magenta 95x16 rectangle at position (161, 22).
; PLAN: r0=161(x), r1=22(y), r2=95(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 22
LDI r2, 95
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
