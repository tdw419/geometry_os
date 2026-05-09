; DESCRIPTION: Places a magenta 91x12 rectangle at position (170, 199).
; PLAN: r0=170(x), r1=199(y), r2=91(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 199
LDI r2, 91
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
