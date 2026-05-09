; DESCRIPTION: Renders a red box of size 61x109 starting at (365, 77).
; PLAN: r0=365(x), r1=77(y), r2=61(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 77
LDI r2, 61
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
