; DESCRIPTION: Places a orange 25x78 rectangle at position (263, 126).
; PLAN: r0=263(x), r1=126(y), r2=25(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 126
LDI r2, 25
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
