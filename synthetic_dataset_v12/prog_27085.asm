; DESCRIPTION: Renders a orange box of size 30x52 starting at (92, 118).
; PLAN: r0=92(x), r1=118(y), r2=30(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 118
LDI r2, 30
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
