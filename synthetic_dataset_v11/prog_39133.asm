; DESCRIPTION: Renders a cyan disk with center (188, 153) and radius 67.
; PLAN: r0=188(x), r1=153(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 153
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
