; DESCRIPTION: Renders a white box of size 70x39 starting at (371, 87).
; PLAN: r0=371(x), r1=87(y), r2=70(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 87
LDI r2, 70
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
