; DESCRIPTION: Renders a red box of size 60x113 starting at (413, 77).
; PLAN: r0=413(x), r1=77(y), r2=60(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 77
LDI r2, 60
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
