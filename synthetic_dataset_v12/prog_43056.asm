; DESCRIPTION: Creates a cyan circular shape at (445, 107) with radius 61.
; PLAN: r0=445(x), r1=107(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 445
LDI r1, 107
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
