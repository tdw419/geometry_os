; DESCRIPTION: Composite: . Then Places a blue circle of radius 26 at center (123, 174). Then Sets a single cyan pixel at (214, 123).
; PLAN: r0=123(x), r1=174(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=214(x), r1=123(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a blue circle of radius 26 at center (123, 174).
; PLAN: r0=123(x), r1=174(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 174
LDI r2, 26
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single cyan pixel at (214, 123).
; PLAN: r0=214(x), r1=123(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2.
LDI r0, 214
LDI r1, 123
LDI r2, 0x00FFFF
PSET r0, r1, r2
HALT
