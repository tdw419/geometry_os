; DESCRIPTION: Renders a cyan disk with center (168, 178) and radius 38.
; PLAN: r0=168(x), r1=178(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 178
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
