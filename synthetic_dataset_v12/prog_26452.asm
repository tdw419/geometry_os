; DESCRIPTION: Places a green 67x24 rectangle at position (156, 138).
; PLAN: r0=156(x), r1=138(y), r2=67(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 138
LDI r2, 67
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
