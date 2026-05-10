; DESCRIPTION: Places a cyan 28x76 rectangle at position (8, 126).
; PLAN: r0=8(x), r1=126(y), r2=28(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 126
LDI r2, 28
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
