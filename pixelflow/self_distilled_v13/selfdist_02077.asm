; DESCRIPTION: Places a cyan disk with center (167, 102) and radius 38.
; PLAN: r0=167(x), r1=102(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 102
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
