; DESCRIPTION: Places a white 45x27 rectangle at position (122, 153).
; PLAN: r0=122(x), r1=153(y), r2=45(width), r3=27(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 153
LDI r2, 45
LDI r3, 27
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
