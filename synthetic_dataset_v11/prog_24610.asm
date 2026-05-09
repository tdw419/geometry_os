; DESCRIPTION: Composite: . Then Sets a single white pixel at (161, 217). Then Places a cyan line segment connecting (202, 152) to (114, 160).
; PLAN: r0=161(x), r1=217(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=202(x1), r1=152(y1), r2=114(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (161, 217).
; PLAN: r0=161(x), r1=217(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 161
LDI r1, 217
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Places a cyan line segment connecting (202, 152) to (114, 160).
; PLAN: r0=202(x1), r1=152(y1), r2=114(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 152
LDI r2, 114
LDI r3, 160
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
