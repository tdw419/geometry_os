; DESCRIPTION: Places a white 75x35 rectangle at position (109, 56).
; PLAN: r0=109(x), r1=56(y), r2=75(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 56
LDI r2, 75
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
