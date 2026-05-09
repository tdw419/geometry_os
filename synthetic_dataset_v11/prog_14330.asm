; DESCRIPTION: Composite: . Then Creates a yellow circular shape at (218, 174) with radius 24. Then Places a red dot at position (87, 244).
; PLAN: r0=218(x), r1=174(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=87(x), r1=244(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Creates a yellow circular shape at (218, 174) with radius 24.
; PLAN: r0=218(x), r1=174(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 218
LDI r1, 174
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red dot at position (87, 244).
; PLAN: r0=87(x), r1=244(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 87
LDI r1, 244
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
