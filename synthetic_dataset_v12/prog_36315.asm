; DESCRIPTION: Places a red 43x80 rectangle at position (462, 67).
; PLAN: r0=462(x), r1=67(y), r2=43(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 67
LDI r2, 43
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
