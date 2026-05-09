; DESCRIPTION: Renders a red box of size 45x40 starting at (52, 107).
; PLAN: r0=52(x), r1=107(y), r2=45(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 107
LDI r2, 45
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
