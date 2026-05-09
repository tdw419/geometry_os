; DESCRIPTION: Places a magenta 23x12 rectangle at position (172, 193).
; PLAN: r0=172(x), r1=193(y), r2=23(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 193
LDI r2, 23
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
