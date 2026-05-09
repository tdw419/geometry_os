; DESCRIPTION: Renders a red box of size 30x73 starting at (23, 125).
; PLAN: r0=23(x), r1=125(y), r2=30(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 125
LDI r2, 30
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
