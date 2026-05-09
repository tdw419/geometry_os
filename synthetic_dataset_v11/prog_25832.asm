; DESCRIPTION: Places a white 26x45 rectangle at position (209, 19).
; PLAN: r0=209(x), r1=19(y), r2=26(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 19
LDI r2, 26
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
