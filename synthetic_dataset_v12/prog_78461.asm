; DESCRIPTION: Places a white 14x26 rectangle at position (363, 125).
; PLAN: r0=363(x), r1=125(y), r2=14(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 125
LDI r2, 14
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
