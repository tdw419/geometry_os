; DESCRIPTION: Places a green 10x17 rectangle at position (128, 178).
; PLAN: r0=128(x), r1=178(y), r2=10(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 178
LDI r2, 10
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
