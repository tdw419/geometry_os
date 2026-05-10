; DESCRIPTION: Places a cyan disk with center (242, 60) and radius 31.
; PLAN: r0=242(x), r1=60(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 60
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
