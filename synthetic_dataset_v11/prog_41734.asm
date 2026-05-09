; DESCRIPTION: Places a white 61x18 rectangle at position (166, 191).
; PLAN: r0=166(x), r1=191(y), r2=61(width), r3=18(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 191
LDI r2, 61
LDI r3, 18
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
