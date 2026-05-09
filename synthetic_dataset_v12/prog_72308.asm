; DESCRIPTION: Renders a red box of size 33x115 starting at (309, 99).
; PLAN: r0=309(x), r1=99(y), r2=33(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 99
LDI r2, 33
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
