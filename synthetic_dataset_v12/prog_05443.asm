; DESCRIPTION: Places a black 58x20 rectangle at position (144, 215).
; PLAN: r0=144(x), r1=215(y), r2=58(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 215
LDI r2, 58
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
