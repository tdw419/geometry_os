; DESCRIPTION: Renders a white box of size 87x16 starting at (329, 75).
; PLAN: r0=329(x), r1=75(y), r2=87(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 75
LDI r2, 87
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
