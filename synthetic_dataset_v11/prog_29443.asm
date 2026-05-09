; DESCRIPTION: Renders a red box of size 14x75 starting at (223, 156).
; PLAN: r0=223(x), r1=156(y), r2=14(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 156
LDI r2, 14
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
