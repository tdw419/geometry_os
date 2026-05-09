; DESCRIPTION: Renders a cyan disk with center (186, 159) and radius 68.
; PLAN: r0=186(x), r1=159(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 159
LDI r2, 68
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
