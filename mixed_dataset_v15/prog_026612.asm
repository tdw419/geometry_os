; DESCRIPTION: Places a orange 38x22 rectangle at position (216, 153).
; PLAN: r0=216(x), r1=153(y), r2=38(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 153
LDI r2, 38
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
