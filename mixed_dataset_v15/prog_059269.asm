; DESCRIPTION: Places a white 13x13 rectangle at position (25, 222).
; PLAN: r0=25(x), r1=222(y), r2=13(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 222
LDI r2, 13
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
