; DESCRIPTION: Renders a cyan circular shape at (72, 150) with radius 68.
; PLAN: r0=72(x), r1=150(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 150
LDI r2, 68
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
