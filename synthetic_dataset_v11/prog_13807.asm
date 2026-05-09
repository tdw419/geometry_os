; DESCRIPTION: Renders a white box of size 104x29 starting at (87, 132).
; PLAN: r0=87(x), r1=132(y), r2=104(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 132
LDI r2, 104
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
