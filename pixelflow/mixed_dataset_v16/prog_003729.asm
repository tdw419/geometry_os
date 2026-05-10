; DESCRIPTION: Places a white 108x107 rectangle at position (217, 125).
; PLAN: r0=217(x), r1=125(y), r2=108(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 125
LDI r2, 108
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
