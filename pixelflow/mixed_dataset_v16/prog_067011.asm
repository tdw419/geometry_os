; DESCRIPTION: Places a white 93x92 rectangle at position (5, 73).
; PLAN: r0=5(x), r1=73(y), r2=93(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 73
LDI r2, 93
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
