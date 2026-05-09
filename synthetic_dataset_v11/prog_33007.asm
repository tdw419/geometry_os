; DESCRIPTION: Places a white 63x23 rectangle at position (125, 171).
; PLAN: r0=125(x), r1=171(y), r2=63(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 171
LDI r2, 63
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
