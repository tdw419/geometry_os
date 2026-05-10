; DESCRIPTION: Places a blue 34x95 rectangle at position (109, 26).
; PLAN: r0=109(x), r1=26(y), r2=34(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 26
LDI r2, 34
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
