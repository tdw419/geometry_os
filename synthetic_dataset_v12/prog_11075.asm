; DESCRIPTION: Places a cyan circle of radius 68 at center (264, 127).
; PLAN: r0=264(x), r1=127(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 127
LDI r2, 68
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
