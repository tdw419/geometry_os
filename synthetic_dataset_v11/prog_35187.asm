; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (68, 42) to (31, 128). Then Places a purple dot at position (209, 137).
; PLAN: r0=68(x1), r1=42(y1), r2=31(x2), r3=128(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=209(x), r1=137(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow line segment connecting (68, 42) to (31, 128).
; PLAN: r0=68(x1), r1=42(y1), r2=31(x2), r3=128(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 42
LDI r2, 31
LDI r3, 128
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (209, 137).
; PLAN: r0=209(x), r1=137(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 209
LDI r1, 137
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
