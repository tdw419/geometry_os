; DESCRIPTION: Places a magenta 34x118 rectangle at position (204, 109).
; PLAN: r0=204(x), r1=109(y), r2=34(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 109
LDI r2, 34
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
