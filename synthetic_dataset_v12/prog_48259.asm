; DESCRIPTION: Places a cyan 11x58 rectangle at position (63, 17).
; PLAN: r0=63(x), r1=17(y), r2=11(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 17
LDI r2, 11
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
