; DESCRIPTION: Renders a red box of size 120x61 starting at (334, 13).
; PLAN: r0=334(x), r1=13(y), r2=120(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 13
LDI r2, 120
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
