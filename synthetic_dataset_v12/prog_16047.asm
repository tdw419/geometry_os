; DESCRIPTION: Renders a white box of size 68x30 starting at (274, 21).
; PLAN: r0=274(x), r1=21(y), r2=68(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 21
LDI r2, 68
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
