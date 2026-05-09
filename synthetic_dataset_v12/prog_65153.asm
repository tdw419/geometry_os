; DESCRIPTION: Renders a cyan disk with center (74, 120) and radius 57.
; PLAN: r0=74(x), r1=120(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 120
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
