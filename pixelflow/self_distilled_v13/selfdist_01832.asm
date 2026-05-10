; DESCRIPTION: Places a cyan disk with center (100, 103) and radius 48.
; PLAN: r0=100(x), r1=103(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 103
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
