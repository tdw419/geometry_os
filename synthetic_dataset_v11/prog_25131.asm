; DESCRIPTION: Composite: . Then Places a red dot at position (147, 111). Then Places a cyan circle of radius 37 at center (217, 218).
; PLAN: r0=147(x), r1=111(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=217(x), r1=218(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red dot at position (147, 111).
; PLAN: r0=147(x), r1=111(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 147
LDI r1, 111
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Places a cyan circle of radius 37 at center (217, 218).
; PLAN: r0=217(x), r1=218(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 218
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
