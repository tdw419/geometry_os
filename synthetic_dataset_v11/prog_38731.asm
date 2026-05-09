; DESCRIPTION: Places a white 57x57 rectangle at position (90, 155).
; PLAN: r0=90(x), r1=155(y), r2=57(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 155
LDI r2, 57
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
