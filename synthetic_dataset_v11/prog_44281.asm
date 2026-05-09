; DESCRIPTION: Renders a red box of size 22x17 starting at (71, 91).
; PLAN: r0=71(x), r1=91(y), r2=22(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 91
LDI r2, 22
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
