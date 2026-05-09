; DESCRIPTION: Creates a cyan circular shape at (158, 74) with radius 46.
; PLAN: r0=158(x), r1=74(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 74
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
