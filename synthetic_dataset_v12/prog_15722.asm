; DESCRIPTION: Renders a red box of size 100x71 starting at (294, 113).
; PLAN: r0=294(x), r1=113(y), r2=100(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 113
LDI r2, 100
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
