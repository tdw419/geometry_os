; DESCRIPTION: Places a red 77x45 rectangle at position (62, 125).
; PLAN: r0=62(x), r1=125(y), r2=77(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 125
LDI r2, 77
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
