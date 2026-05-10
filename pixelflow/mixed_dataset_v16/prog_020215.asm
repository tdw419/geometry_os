; DESCRIPTION: Places a magenta 109x49 rectangle at position (174, 52).
; PLAN: r0=174(x), r1=52(y), r2=109(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 52
LDI r2, 109
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
