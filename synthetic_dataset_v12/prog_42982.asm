; DESCRIPTION: Renders a white box of size 84x95 starting at (107, 70).
; PLAN: r0=107(x), r1=70(y), r2=84(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 70
LDI r2, 84
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
