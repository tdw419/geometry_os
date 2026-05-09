; DESCRIPTION: Renders a red box of size 18x52 starting at (281, 6).
; PLAN: r0=281(x), r1=6(y), r2=18(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 6
LDI r2, 18
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
