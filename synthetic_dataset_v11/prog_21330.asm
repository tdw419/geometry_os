; DESCRIPTION: Places a white 24x87 rectangle at position (125, 99).
; PLAN: r0=125(x), r1=99(y), r2=24(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 99
LDI r2, 24
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
