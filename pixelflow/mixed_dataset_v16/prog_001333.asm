; DESCRIPTION: Renders a cyan disk with center (368, 162) and radius 56.
; PLAN: r0=368(x), r1=162(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 162
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
