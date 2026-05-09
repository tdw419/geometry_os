; DESCRIPTION: Renders a red box of size 113x74 starting at (38, 52).
; PLAN: r0=38(x), r1=52(y), r2=113(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 52
LDI r2, 113
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
