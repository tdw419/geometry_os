; DESCRIPTION: Places a cyan disk with center (328, 53) and radius 16.
; PLAN: r0=328(x), r1=53(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 53
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
