; DESCRIPTION: Renders a cyan disk with center (350, 124) and radius 72.
; PLAN: r0=350(x), r1=124(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 124
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
