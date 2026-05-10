; DESCRIPTION: Creates a cyan circular shape at (302, 146) with radius 47.
; PLAN: r0=302(x), r1=146(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 146
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
