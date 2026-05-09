; DESCRIPTION: Composite: . Then Renders a red box of size 40x112 starting at (76, 108). Then Sets a single black pixel at (247, 76).
; PLAN: r0=76(x), r1=108(y), r2=40(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=247(x), r1=76(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a red box of size 40x112 starting at (76, 108).
; PLAN: r0=76(x), r1=108(y), r2=40(width), r3=112(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 108
LDI r2, 40
LDI r3, 112
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (247, 76).
; PLAN: r0=247(x), r1=76(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 247
LDI r1, 76
LDI r2, 0x000000
PSET r0, r1, r2
HALT
