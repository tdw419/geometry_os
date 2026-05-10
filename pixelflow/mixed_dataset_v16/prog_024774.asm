; DESCRIPTION: Renders a red box of size 60x39 starting at (166, 11).
; PLAN: r0=166(x), r1=11(y), r2=60(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 11
LDI r2, 60
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
