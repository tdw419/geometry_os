; DESCRIPTION: Renders a cyan disk with center (162, 113) and radius 70.
; PLAN: r0=162(x), r1=113(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 113
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
