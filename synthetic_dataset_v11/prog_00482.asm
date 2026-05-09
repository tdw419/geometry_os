; DESCRIPTION: Places a white 114x76 rectangle at position (0, 112).
; PLAN: r0=0(x), r1=112(y), r2=114(width), r3=76(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 112
LDI r2, 114
LDI r3, 76
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
