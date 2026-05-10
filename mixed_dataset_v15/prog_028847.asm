; DESCRIPTION: Renders a white box of size 20x120 starting at (324, 135).
; PLAN: r0=324(x), r1=135(y), r2=20(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 135
LDI r2, 20
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
