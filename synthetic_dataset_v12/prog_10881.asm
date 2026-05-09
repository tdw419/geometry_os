; DESCRIPTION: Renders a cyan disk with center (392, 136) and radius 68.
; PLAN: r0=392(x), r1=136(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 136
LDI r2, 68
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
