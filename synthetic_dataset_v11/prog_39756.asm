; DESCRIPTION: Places a white 68x63 rectangle at position (134, 29).
; PLAN: r0=134(x), r1=29(y), r2=68(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 29
LDI r2, 68
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
