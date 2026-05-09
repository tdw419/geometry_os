; DESCRIPTION: Places a black 85x73 rectangle at position (239, 54).
; PLAN: r0=239(x), r1=54(y), r2=85(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 54
LDI r2, 85
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
