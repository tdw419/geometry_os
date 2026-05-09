; DESCRIPTION: Renders a cyan disk with center (328, 133) and radius 32.
; PLAN: r0=328(x), r1=133(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 133
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
