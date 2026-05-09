; DESCRIPTION: Places a white 12x35 rectangle at position (293, 100).
; PLAN: r0=293(x), r1=100(y), r2=12(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 100
LDI r2, 12
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
