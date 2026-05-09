; DESCRIPTION: Places a black 12x89 rectangle at position (206, 126).
; PLAN: r0=206(x), r1=126(y), r2=12(width), r3=89(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 126
LDI r2, 12
LDI r3, 89
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
