; DESCRIPTION: Places a yellow 63x18 rectangle at position (344, 126).
; PLAN: r0=344(x), r1=126(y), r2=63(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 126
LDI r2, 63
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
