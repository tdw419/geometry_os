; DESCRIPTION: Places a cyan 13x15 box at position (206, 112).
; PLAN: r0=206(x), r1=112(y), r2=13(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 112
LDI r2, 13
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
