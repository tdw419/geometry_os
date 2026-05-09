; DESCRIPTION: Places a magenta 118x45 rectangle at position (291, 161).
; PLAN: r0=291(x), r1=161(y), r2=118(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 161
LDI r2, 118
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
