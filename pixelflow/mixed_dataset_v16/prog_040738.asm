; DESCRIPTION: Renders a red box of size 18x120 starting at (486, 132).
; PLAN: r0=486(x), r1=132(y), r2=18(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 132
LDI r2, 18
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
