; DESCRIPTION: Places a black 19x120 rectangle at position (212, 95).
; PLAN: r0=212(x), r1=95(y), r2=19(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 95
LDI r2, 19
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
