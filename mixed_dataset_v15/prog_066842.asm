; DESCRIPTION: Places a cyan circle of radius 59 at center (276, 90).
; PLAN: r0=276(x), r1=90(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 90
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
