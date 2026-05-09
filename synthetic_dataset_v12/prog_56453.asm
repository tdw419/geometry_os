; DESCRIPTION: Places a white 115x64 rectangle at position (348, 37).
; PLAN: r0=348(x), r1=37(y), r2=115(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 37
LDI r2, 115
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
