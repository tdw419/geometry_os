; DESCRIPTION: Renders a cyan disk with center (168, 102) and radius 61.
; PLAN: r0=168(x), r1=102(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 102
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
