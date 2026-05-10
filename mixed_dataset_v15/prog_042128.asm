; DESCRIPTION: Places a cyan circle of radius 40 at center (112, 68).
; PLAN: r0=112(x), r1=68(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 68
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
