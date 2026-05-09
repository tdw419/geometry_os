; DESCRIPTION: Renders a red box of size 52x77 starting at (92, 27).
; PLAN: r0=92(x), r1=27(y), r2=52(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 27
LDI r2, 52
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
