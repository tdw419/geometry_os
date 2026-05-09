; DESCRIPTION: Places a cyan circle of radius 30 at center (227, 213).
; PLAN: r0=227(x), r1=213(y), r2=30(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 213
LDI r2, 30
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
