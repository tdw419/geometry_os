; DESCRIPTION: Renders a cyan disk with center (256, 133) and radius 46.
; PLAN: r0=256(x), r1=133(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 133
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
