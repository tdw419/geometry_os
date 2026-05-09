; DESCRIPTION: Renders a red box of size 108x44 starting at (141, 17).
; PLAN: r0=141(x), r1=17(y), r2=108(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 17
LDI r2, 108
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
