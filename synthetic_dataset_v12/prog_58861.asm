; DESCRIPTION: Renders a white box of size 101x47 starting at (124, 15).
; PLAN: r0=124(x), r1=15(y), r2=101(width), r3=47(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 15
LDI r2, 101
LDI r3, 47
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
