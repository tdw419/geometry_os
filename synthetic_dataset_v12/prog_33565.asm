; DESCRIPTION: Renders a red box of size 98x39 starting at (385, 216).
; PLAN: r0=385(x), r1=216(y), r2=98(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 216
LDI r2, 98
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
