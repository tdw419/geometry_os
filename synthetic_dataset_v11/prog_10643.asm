; DESCRIPTION: Places a white 52x38 rectangle at position (13, 11).
; PLAN: r0=13(x), r1=11(y), r2=52(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 11
LDI r2, 52
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
