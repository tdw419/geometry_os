; DESCRIPTION: Creates a cyan circular shape at (146, 146) with radius 76.
; PLAN: r0=146(x), r1=146(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 146
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
