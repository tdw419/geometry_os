; DESCRIPTION: Creates a cyan circular shape at (180, 72) with radius 71.
; PLAN: r0=180(x), r1=72(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 72
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
