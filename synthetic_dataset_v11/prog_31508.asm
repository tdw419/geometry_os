; DESCRIPTION: Renders a white box of size 70x104 starting at (144, 132).
; PLAN: r0=144(x), r1=132(y), r2=70(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 132
LDI r2, 70
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
