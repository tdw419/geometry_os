; DESCRIPTION: Renders a red box of size 24x75 starting at (282, 57).
; PLAN: r0=282(x), r1=57(y), r2=24(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 57
LDI r2, 24
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
