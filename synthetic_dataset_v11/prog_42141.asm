; DESCRIPTION: Creates a cyan circular shape at (156, 228) with radius 18.
; PLAN: r0=156(x), r1=228(y), r2=18(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 156
LDI r1, 228
LDI r2, 18
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
