; DESCRIPTION: Renders a red disk with center (242, 210) and radius 14.
; PLAN: r0=242(x), r1=210(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 210
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
