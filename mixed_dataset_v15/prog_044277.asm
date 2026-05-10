; DESCRIPTION: Renders a red box of size 106x105 starting at (61, 70).
; PLAN: r0=61(x), r1=70(y), r2=106(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 70
LDI r2, 106
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
