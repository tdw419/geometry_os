; DESCRIPTION: Places a white 100x120 rectangle at position (338, 13).
; PLAN: r0=338(x), r1=13(y), r2=100(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 13
LDI r2, 100
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
