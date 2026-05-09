; DESCRIPTION: Places a orange 114x60 rectangle at position (300, 183).
; PLAN: r0=300(x), r1=183(y), r2=114(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 183
LDI r2, 114
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
