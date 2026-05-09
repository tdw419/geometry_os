; DESCRIPTION: Renders a cyan disk with center (175, 60) and radius 38.
; PLAN: r0=175(x), r1=60(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 60
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
