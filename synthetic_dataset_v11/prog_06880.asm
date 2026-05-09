; DESCRIPTION: Places a red 56x71 rectangle at position (51, 125).
; PLAN: r0=51(x), r1=125(y), r2=56(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 125
LDI r2, 56
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
