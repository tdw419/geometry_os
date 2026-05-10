; DESCRIPTION: Places a red 114x67 rectangle at position (283, 0).
; PLAN: r0=283(x), r1=0(y), r2=114(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 0
LDI r2, 114
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
