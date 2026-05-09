; DESCRIPTION: Renders a red box of size 89x119 starting at (64, 91).
; PLAN: r0=64(x), r1=91(y), r2=89(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 91
LDI r2, 89
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
