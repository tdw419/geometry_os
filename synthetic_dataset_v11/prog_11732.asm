; DESCRIPTION: Renders a cyan disk with center (187, 99) and radius 58.
; PLAN: r0=187(x), r1=99(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 99
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
