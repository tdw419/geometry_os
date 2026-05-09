; DESCRIPTION: Places a cyan circle of radius 75 at center (166, 117).
; PLAN: r0=166(x), r1=117(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 117
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
