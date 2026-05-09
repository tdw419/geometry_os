; DESCRIPTION: Places a cyan 21x15 rectangle at position (114, 45).
; PLAN: r0=114(x), r1=45(y), r2=21(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 45
LDI r2, 21
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
