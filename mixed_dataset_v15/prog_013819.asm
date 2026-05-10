; DESCRIPTION: Renders a red box of size 17x46 starting at (286, 187).
; PLAN: r0=286(x), r1=187(y), r2=17(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 187
LDI r2, 17
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
