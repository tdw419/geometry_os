; DESCRIPTION: Places a magenta 21x33 rectangle at position (491, 170).
; PLAN: r0=491(x), r1=170(y), r2=21(width), r3=33(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 170
LDI r2, 21
LDI r3, 33
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
