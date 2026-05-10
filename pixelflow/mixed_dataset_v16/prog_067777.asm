; DESCRIPTION: Places a red disk with center (242, 46) and radius 43.
; PLAN: r0=242(x), r1=46(y), r2=43(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 46
LDI r2, 43
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
