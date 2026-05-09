; DESCRIPTION: Places a white 77x113 rectangle at position (208, 41).
; PLAN: r0=208(x), r1=41(y), r2=77(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 41
LDI r2, 77
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
