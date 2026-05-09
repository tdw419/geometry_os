; DESCRIPTION: Places a yellow 84x86 rectangle at position (316, 126).
; PLAN: r0=316(x), r1=126(y), r2=84(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 126
LDI r2, 84
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
