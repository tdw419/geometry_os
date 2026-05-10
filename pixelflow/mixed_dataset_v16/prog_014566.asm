; DESCRIPTION: Places a white 39x35 rectangle at position (178, 170).
; PLAN: r0=178(x), r1=170(y), r2=39(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 170
LDI r2, 39
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
