; DESCRIPTION: Renders a cyan disk with center (445, 149) and radius 55.
; PLAN: r0=445(x), r1=149(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 445
LDI r1, 149
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
