; DESCRIPTION: Places a white 28x18 rectangle at position (15, 54).
; PLAN: r0=15(x), r1=54(y), r2=28(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 54
LDI r2, 28
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
