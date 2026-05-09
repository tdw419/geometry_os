; DESCRIPTION: Places a white 57x91 rectangle at position (5, 155).
; PLAN: r0=5(x), r1=155(y), r2=57(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 155
LDI r2, 57
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
