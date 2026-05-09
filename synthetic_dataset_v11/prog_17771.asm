; DESCRIPTION: Places a black 107x45 rectangle at position (126, 150).
; PLAN: r0=126(x), r1=150(y), r2=107(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 150
LDI r2, 107
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
