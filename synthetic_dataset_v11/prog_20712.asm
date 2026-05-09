; DESCRIPTION: Renders a cyan disk with center (90, 197) and radius 57.
; PLAN: r0=90(x), r1=197(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 197
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
