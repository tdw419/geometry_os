; DESCRIPTION: Renders a cyan disk with center (180, 160) and radius 80.
; PLAN: r0=180(x), r1=160(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 160
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
