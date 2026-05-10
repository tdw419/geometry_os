; DESCRIPTION: Places a white 19x35 box at position (249, 39).
; PLAN: r0=249(x), r1=39(y), r2=19(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 39
LDI r2, 19
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
