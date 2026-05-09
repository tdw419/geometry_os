; DESCRIPTION: Places a cyan circle of radius 44 at center (70, 171).
; PLAN: r0=70(x), r1=171(y), r2=44(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 171
LDI r2, 44
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
