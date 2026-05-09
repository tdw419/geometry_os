; DESCRIPTION: Renders a white box of size 97x67 starting at (342, 183).
; PLAN: r0=342(x), r1=183(y), r2=97(width), r3=67(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 183
LDI r2, 97
LDI r3, 67
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
