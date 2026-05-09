; DESCRIPTION: Renders a cyan disk with center (206, 120) and radius 28.
; PLAN: r0=206(x), r1=120(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 120
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
