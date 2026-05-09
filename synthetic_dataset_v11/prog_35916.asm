; DESCRIPTION: Creates a cyan circular shape at (150, 111) with radius 72.
; PLAN: r0=150(x), r1=111(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 111
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
