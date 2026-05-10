; DESCRIPTION: Renders a cyan disk with center (308, 146) and radius 19.
; PLAN: r0=308(x), r1=146(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 146
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
