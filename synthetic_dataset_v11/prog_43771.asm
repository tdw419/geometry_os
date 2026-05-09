; DESCRIPTION: Renders a red box of size 35x25 starting at (98, 193).
; PLAN: r0=98(x), r1=193(y), r2=35(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 193
LDI r2, 35
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
