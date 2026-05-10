; DESCRIPTION: Renders a cyan disk with center (236, 82) and radius 13.
; PLAN: r0=236(x), r1=82(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 236
LDI r1, 82
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
