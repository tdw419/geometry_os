; DESCRIPTION: Places a white 119x16 rectangle at position (209, 125).
; PLAN: r0=209(x), r1=125(y), r2=119(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 125
LDI r2, 119
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
