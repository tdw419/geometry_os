; DESCRIPTION: Renders a red box of size 84x113 starting at (113, 134).
; PLAN: r0=113(x), r1=134(y), r2=84(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 134
LDI r2, 84
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
