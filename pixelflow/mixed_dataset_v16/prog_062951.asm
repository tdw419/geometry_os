; DESCRIPTION: Renders a red disk with center (446, 190) and radius 31.
; PLAN: r0=446(x), r1=190(y), r2=31(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 446
LDI r1, 190
LDI r2, 31
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
