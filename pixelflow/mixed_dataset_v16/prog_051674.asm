; DESCRIPTION: Places a orange disk with center (242, 47) and radius 72.
; PLAN: r0=242(x), r1=47(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 47
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
