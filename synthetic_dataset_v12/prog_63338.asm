; DESCRIPTION: Renders a red box of size 95x77 starting at (365, 67).
; PLAN: r0=365(x), r1=67(y), r2=95(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 67
LDI r2, 95
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
