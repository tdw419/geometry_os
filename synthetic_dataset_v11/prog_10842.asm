; DESCRIPTION: Renders a white box of size 32x48 starting at (188, 140).
; PLAN: r0=188(x), r1=140(y), r2=32(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 140
LDI r2, 32
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
