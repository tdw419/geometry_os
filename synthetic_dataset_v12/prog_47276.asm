; DESCRIPTION: Renders a red box of size 119x13 starting at (178, 125).
; PLAN: r0=178(x), r1=125(y), r2=119(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 125
LDI r2, 119
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
