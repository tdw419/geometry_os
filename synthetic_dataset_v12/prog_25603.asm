; DESCRIPTION: Renders a cyan disk with center (313, 146) and radius 23.
; PLAN: r0=313(x), r1=146(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 313
LDI r1, 146
LDI r2, 23
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
