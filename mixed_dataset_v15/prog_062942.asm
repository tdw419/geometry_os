; DESCRIPTION: Places a cyan 15x119 rectangle at position (269, 126).
; PLAN: r0=269(x), r1=126(y), r2=15(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 126
LDI r2, 15
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
