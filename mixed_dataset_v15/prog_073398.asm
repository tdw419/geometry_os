; DESCRIPTION: Places a cyan disk with center (21, 8) and radius 70.
; PLAN: r0=21(x), r1=8(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 21
LDI r1, 8
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
