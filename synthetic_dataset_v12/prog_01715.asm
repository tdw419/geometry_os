; DESCRIPTION: Renders a red box of size 105x29 starting at (21, 125).
; PLAN: r0=21(x), r1=125(y), r2=105(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 125
LDI r2, 105
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
