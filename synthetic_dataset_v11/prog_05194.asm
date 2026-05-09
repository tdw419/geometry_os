; DESCRIPTION: Renders a white box of size 78x75 starting at (135, 27).
; PLAN: r0=135(x), r1=27(y), r2=78(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 27
LDI r2, 78
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
