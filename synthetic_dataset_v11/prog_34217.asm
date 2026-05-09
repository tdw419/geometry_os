; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (162, 207) to (208, 0). Then Places a red dot at position (253, 42).
; PLAN: r0=162(x1), r1=207(y1), r2=208(x2), r3=0(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=253(x), r1=42(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow line segment connecting (162, 207) to (208, 0).
; PLAN: r0=162(x1), r1=207(y1), r2=208(x2), r3=0(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 207
LDI r2, 208
LDI r3, 0
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red dot at position (253, 42).
; PLAN: r0=253(x), r1=42(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 253
LDI r1, 42
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
