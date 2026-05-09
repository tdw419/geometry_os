; DESCRIPTION: Places a red 73x17 rectangle at position (13, 64).
; PLAN: r0=13(x), r1=64(y), r2=73(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 64
LDI r2, 73
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
