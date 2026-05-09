; DESCRIPTION: Places a white 25x107 rectangle at position (382, 1).
; PLAN: r0=382(x), r1=1(y), r2=25(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 1
LDI r2, 25
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
