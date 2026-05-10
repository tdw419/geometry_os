; DESCRIPTION: Places a cyan 72x88 rectangle at position (126, 26).
; PLAN: r0=126(x), r1=26(y), r2=72(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 26
LDI r2, 72
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
