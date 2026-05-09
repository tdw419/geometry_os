; DESCRIPTION: Places a white 40x73 rectangle at position (442, 75).
; PLAN: r0=442(x), r1=75(y), r2=40(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 75
LDI r2, 40
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
