; DESCRIPTION: Renders a cyan disk with center (121, 196) and radius 42.
; PLAN: r0=121(x), r1=196(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 196
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
