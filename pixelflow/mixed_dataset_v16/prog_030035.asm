; DESCRIPTION: Renders a cyan disk with center (387, 80) and radius 54.
; PLAN: r0=387(x), r1=80(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 80
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
