; DESCRIPTION: Places a white 59x105 rectangle at position (107, 52).
; PLAN: r0=107(x), r1=52(y), r2=59(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 52
LDI r2, 59
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
