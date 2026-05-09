; DESCRIPTION: Places a magenta 21x54 rectangle at position (422, 114).
; PLAN: r0=422(x), r1=114(y), r2=21(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 114
LDI r2, 21
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
