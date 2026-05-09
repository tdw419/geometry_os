; DESCRIPTION: Creates a cyan circular shape at (446, 121) with radius 65.
; PLAN: r0=446(x), r1=121(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 446
LDI r1, 121
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
