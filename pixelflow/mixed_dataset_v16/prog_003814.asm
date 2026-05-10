; DESCRIPTION: Renders a white box of size 93x54 starting at (269, 72).
; PLAN: r0=269(x), r1=72(y), r2=93(width), r3=54(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 72
LDI r2, 93
LDI r3, 54
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
