; DESCRIPTION: Renders a red box of size 53x120 starting at (199, 91).
; PLAN: r0=199(x), r1=91(y), r2=53(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 91
LDI r2, 53
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
