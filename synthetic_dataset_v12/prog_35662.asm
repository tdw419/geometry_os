; DESCRIPTION: Places a cyan circle of radius 72 at center (294, 97).
; PLAN: r0=294(x), r1=97(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 97
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
