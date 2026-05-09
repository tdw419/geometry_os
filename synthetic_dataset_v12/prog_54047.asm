; DESCRIPTION: Creates a cyan circular shape at (446, 126) with radius 23.
; PLAN: r0=446(x), r1=126(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 446
LDI r1, 126
LDI r2, 23
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
