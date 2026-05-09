; DESCRIPTION: Places a black 21x67 rectangle at position (265, 172).
; PLAN: r0=265(x), r1=172(y), r2=21(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 172
LDI r2, 21
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
