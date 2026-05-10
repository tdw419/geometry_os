; DESCRIPTION: Renders a red box of size 74x105 starting at (425, 32).
; PLAN: r0=425(x), r1=32(y), r2=74(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 32
LDI r2, 74
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
