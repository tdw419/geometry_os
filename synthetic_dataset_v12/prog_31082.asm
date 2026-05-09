; DESCRIPTION: Places a red 86x76 rectangle at position (145, 126).
; PLAN: r0=145(x), r1=126(y), r2=86(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 126
LDI r2, 86
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
