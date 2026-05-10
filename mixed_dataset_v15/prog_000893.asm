; DESCRIPTION: Places a green 64x103 box at position (126, 27).
; PLAN: r0=126(x), r1=27(y), r2=64(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 27
LDI r2, 64
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
