; DESCRIPTION: Places a magenta 106x87 rectangle at position (34, 140).
; PLAN: r0=34(x), r1=140(y), r2=106(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 140
LDI r2, 106
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
