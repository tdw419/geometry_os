; DESCRIPTION: Renders a red box of size 17x115 starting at (385, 26).
; PLAN: r0=385(x), r1=26(y), r2=17(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 26
LDI r2, 17
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
