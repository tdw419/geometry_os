; DESCRIPTION: Places a white 36x23 rectangle at position (15, 36).
; PLAN: r0=15(x), r1=36(y), r2=36(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 36
LDI r2, 36
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
