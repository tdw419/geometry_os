; DESCRIPTION: Places a black 19x27 rectangle at position (251, 30).
; PLAN: r0=251(x), r1=30(y), r2=19(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 30
LDI r2, 19
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
