; DESCRIPTION: Composite: . Then Places a magenta dot at position (153, 165). Then Places a white line segment connecting (128, 178) to (16, 217).
; PLAN: r0=153(x), r1=165(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=128(x1), r1=178(y1), r2=16(x2), r3=217(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (153, 165).
; PLAN: r0=153(x), r1=165(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 153
LDI r1, 165
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Places a white line segment connecting (128, 178) to (16, 217).
; PLAN: r0=128(x1), r1=178(y1), r2=16(x2), r3=217(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 178
LDI r2, 16
LDI r3, 217
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
