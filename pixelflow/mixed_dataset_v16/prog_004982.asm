; DESCRIPTION: Places a green 32x17 rectangle at position (14, 166).
; PLAN: r0=14(x), r1=166(y), r2=32(width), r3=17(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 166
LDI r2, 32
LDI r3, 17
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
