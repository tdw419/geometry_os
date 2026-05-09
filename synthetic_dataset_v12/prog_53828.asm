; DESCRIPTION: Places a white 73x10 rectangle at position (52, 43).
; PLAN: r0=52(x), r1=43(y), r2=73(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 43
LDI r2, 73
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
