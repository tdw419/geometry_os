; DESCRIPTION: Places a white 77x11 rectangle at position (113, 19).
; PLAN: r0=113(x), r1=19(y), r2=77(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 19
LDI r2, 77
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
