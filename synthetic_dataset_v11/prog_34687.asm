; DESCRIPTION: Renders a cyan disk with center (79, 149) and radius 29.
; PLAN: r0=79(x), r1=149(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 149
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
