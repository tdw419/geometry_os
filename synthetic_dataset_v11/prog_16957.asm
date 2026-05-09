; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (150, 80) with radius 54. Then Places a red dot at position (152, 251).
; PLAN: r0=150(x), r1=80(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=152(x), r1=251(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a yellow circular shape at (150, 80) with radius 54.
; PLAN: r0=150(x), r1=80(y), r2=54(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 150
LDI r1, 80
LDI r2, 54
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red dot at position (152, 251).
; PLAN: r0=152(x), r1=251(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 152
LDI r1, 251
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
