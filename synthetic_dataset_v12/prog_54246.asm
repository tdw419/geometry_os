; DESCRIPTION: Places a red 15x90 rectangle at position (128, 126).
; PLAN: r0=128(x), r1=126(y), r2=15(width), r3=90(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 126
LDI r2, 15
LDI r3, 90
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
