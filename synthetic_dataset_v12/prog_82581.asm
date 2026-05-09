; DESCRIPTION: Creates a cyan circular shape at (197, 177) with radius 22.
; PLAN: r0=197(x), r1=177(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 177
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
