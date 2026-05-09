; DESCRIPTION: Places a white 115x72 rectangle at position (63, 90).
; PLAN: r0=63(x), r1=90(y), r2=115(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 90
LDI r2, 115
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
