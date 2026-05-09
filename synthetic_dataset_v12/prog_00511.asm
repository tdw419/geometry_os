; DESCRIPTION: Places a black 36x24 rectangle at position (348, 215).
; PLAN: r0=348(x), r1=215(y), r2=36(width), r3=24(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 215
LDI r2, 36
LDI r3, 24
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
