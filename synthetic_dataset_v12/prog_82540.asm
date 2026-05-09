; DESCRIPTION: Creates a cyan circular shape at (206, 150) with radius 74.
; PLAN: r0=206(x), r1=150(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 150
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
