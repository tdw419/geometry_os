; DESCRIPTION: Places a black 21x16 rectangle at position (413, 137).
; PLAN: r0=413(x), r1=137(y), r2=21(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 137
LDI r2, 21
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
