; DESCRIPTION: Places a magenta 31x82 rectangle at position (34, 118).
; PLAN: r0=34(x), r1=118(y), r2=31(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 118
LDI r2, 31
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
