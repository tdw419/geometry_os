; DESCRIPTION: Composite: . Then Places a green dot at position (164, 175). Then Creates a red circular shape at (123, 158) with radius 80.
; PLAN: r0=164(x), r1=175(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=123(x), r1=158(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green dot at position (164, 175).
; PLAN: r0=164(x), r1=175(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 164
LDI r1, 175
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Creates a red circular shape at (123, 158) with radius 80.
; PLAN: r0=123(x), r1=158(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 158
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
