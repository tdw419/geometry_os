; DESCRIPTION: Places a red 77x43 rectangle at position (432, 125).
; PLAN: r0=432(x), r1=125(y), r2=77(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 125
LDI r2, 77
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
