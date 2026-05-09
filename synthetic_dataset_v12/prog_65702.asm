; DESCRIPTION: Creates a cyan circular shape at (275, 194) with radius 50.
; PLAN: r0=275(x), r1=194(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 194
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
