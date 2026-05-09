; DESCRIPTION: Renders a red box of size 73x113 starting at (120, 39).
; PLAN: r0=120(x), r1=39(y), r2=73(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 39
LDI r2, 73
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
