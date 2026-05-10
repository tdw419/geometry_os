; DESCRIPTION: Places a cyan disk with center (44, 127) and radius 60.
; PLAN: r0=44(x), r1=127(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 44
LDI r1, 127
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
