; DESCRIPTION: Renders a white box of size 32x70 starting at (142, 60).
; PLAN: r0=142(x), r1=60(y), r2=32(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 60
LDI r2, 32
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
