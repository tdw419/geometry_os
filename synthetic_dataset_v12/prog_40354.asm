; DESCRIPTION: Creates a cyan circular shape at (361, 164) with radius 50.
; PLAN: r0=361(x), r1=164(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 361
LDI r1, 164
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
