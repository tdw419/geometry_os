; DESCRIPTION: Renders a red disk with center (187, 122) and radius 28.
; PLAN: r0=187(x), r1=122(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 122
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
