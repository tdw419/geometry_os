; DESCRIPTION: Places a orange 101x68 rectangle at position (153, 20).
; PLAN: r0=153(x), r1=20(y), r2=101(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 20
LDI r2, 101
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
