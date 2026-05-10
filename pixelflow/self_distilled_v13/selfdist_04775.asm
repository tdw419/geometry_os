; DESCRIPTION: Places a cyan 17x12 box at position (215, 101).
; PLAN: r0=215(x), r1=101(y), r2=17(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 101
LDI r2, 17
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
