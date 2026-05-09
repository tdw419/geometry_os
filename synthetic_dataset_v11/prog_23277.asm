; DESCRIPTION: Renders a cyan disk with center (180, 82) and radius 58.
; PLAN: r0=180(x), r1=82(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 82
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
