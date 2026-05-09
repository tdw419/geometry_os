; DESCRIPTION: Places a white 95x91 rectangle at position (49, 125).
; PLAN: r0=49(x), r1=125(y), r2=95(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 125
LDI r2, 95
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
