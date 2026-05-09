; DESCRIPTION: Places a black 42x37 rectangle at position (239, 1).
; PLAN: r0=239(x), r1=1(y), r2=42(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 1
LDI r2, 42
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
