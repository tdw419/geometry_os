; DESCRIPTION: Renders a red box of size 36x26 starting at (419, 61).
; PLAN: r0=419(x), r1=61(y), r2=36(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 61
LDI r2, 36
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
