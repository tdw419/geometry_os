; DESCRIPTION: Renders a cyan circular shape at (392, 75) with radius 12.
; PLAN: r0=392(x), r1=75(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 75
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
