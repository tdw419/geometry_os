; DESCRIPTION: Places a red 58x95 rectangle at position (233, 67).
; PLAN: r0=233(x), r1=67(y), r2=58(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 67
LDI r2, 58
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
