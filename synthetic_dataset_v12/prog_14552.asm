; DESCRIPTION: Renders a cyan disk with center (150, 170) and radius 28.
; PLAN: r0=150(x), r1=170(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 170
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
