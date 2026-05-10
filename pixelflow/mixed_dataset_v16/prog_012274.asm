; DESCRIPTION: Renders a red box of size 47x46 starting at (458, 46).
; PLAN: r0=458(x), r1=46(y), r2=47(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 46
LDI r2, 47
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
