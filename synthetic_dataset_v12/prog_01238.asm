; DESCRIPTION: Creates a cyan circular shape at (298, 131) with radius 40.
; PLAN: r0=298(x), r1=131(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 298
LDI r1, 131
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
