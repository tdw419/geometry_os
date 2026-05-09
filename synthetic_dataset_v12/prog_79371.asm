; DESCRIPTION: Places a yellow 116x42 rectangle at position (17, 24).
; PLAN: r0=17(x), r1=24(y), r2=116(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 24
LDI r2, 116
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
