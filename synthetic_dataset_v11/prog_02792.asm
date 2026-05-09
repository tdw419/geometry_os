; DESCRIPTION: Composite: . Then Places a black line segment connecting (154, 128) to (40, 193). Then Sets a single white pixel at (228, 140).
; PLAN: r0=154(x1), r1=128(y1), r2=40(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=228(x), r1=140(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black line segment connecting (154, 128) to (40, 193).
; PLAN: r0=154(x1), r1=128(y1), r2=40(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 128
LDI r2, 40
LDI r3, 193
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (228, 140).
; PLAN: r0=228(x), r1=140(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 228
LDI r1, 140
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
