; DESCRIPTION: Places a red 119x91 rectangle at position (148, 67).
; PLAN: r0=148(x), r1=67(y), r2=119(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 67
LDI r2, 119
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
