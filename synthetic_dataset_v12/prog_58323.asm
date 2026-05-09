; DESCRIPTION: Places a white 33x36 rectangle at position (396, 70).
; PLAN: r0=396(x), r1=70(y), r2=33(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 70
LDI r2, 33
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
