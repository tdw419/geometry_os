; DESCRIPTION: Places a black 79x34 rectangle at position (74, 42).
; PLAN: r0=74(x), r1=42(y), r2=79(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 42
LDI r2, 79
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
