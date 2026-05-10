; DESCRIPTION: Places a white 14x81 rectangle at position (398, 125).
; PLAN: r0=398(x), r1=125(y), r2=14(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 125
LDI r2, 14
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
