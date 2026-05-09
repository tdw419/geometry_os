; DESCRIPTION: Renders a red box of size 21x77 starting at (166, 73).
; PLAN: r0=166(x), r1=73(y), r2=21(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 73
LDI r2, 21
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
