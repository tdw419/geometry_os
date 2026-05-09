; DESCRIPTION: Places a magenta 78x12 rectangle at position (342, 193).
; PLAN: r0=342(x), r1=193(y), r2=78(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 193
LDI r2, 78
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
