; DESCRIPTION: Places a white 28x119 rectangle at position (163, 125).
; PLAN: r0=163(x), r1=125(y), r2=28(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 125
LDI r2, 28
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
