; DESCRIPTION: Places a white 57x83 rectangle at position (28, 141).
; PLAN: r0=28(x), r1=141(y), r2=57(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 141
LDI r2, 57
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
