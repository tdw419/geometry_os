; DESCRIPTION: Places a red 108x36 rectangle at position (22, 12).
; PLAN: r0=22(x), r1=12(y), r2=108(width), r3=36(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 12
LDI r2, 108
LDI r3, 36
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
