; DESCRIPTION: Renders a cyan circular shape at (38, 25) with radius 46.
; PLAN: r0=38(x), r1=25(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 38
LDI r1, 25
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
