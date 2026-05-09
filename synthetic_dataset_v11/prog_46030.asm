; DESCRIPTION: Renders a white box of size 28x98 starting at (47, 144).
; PLAN: r0=47(x), r1=144(y), r2=28(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 144
LDI r2, 28
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
