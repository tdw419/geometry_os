; DESCRIPTION: Composite: . Then Places a red dot at position (224, 137). Then Places a yellow line segment connecting (50, 30) to (32, 6).
; PLAN: r0=224(x), r1=137(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r0=50(x1), r1=30(y1), r2=32(x2), r3=6(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red dot at position (224, 137).
; PLAN: r0=224(x), r1=137(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 224
LDI r1, 137
LDI r2, 0xFF0000
PSET r0, r1, r2
; DESCRIPTION: Places a yellow line segment connecting (50, 30) to (32, 6).
; PLAN: r0=50(x1), r1=30(y1), r2=32(x2), r3=6(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 30
LDI r2, 32
LDI r3, 6
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
