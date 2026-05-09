; DESCRIPTION: Renders a red box of size 96x47 starting at (199, 106).
; PLAN: r0=199(x), r1=106(y), r2=96(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 106
LDI r2, 96
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
