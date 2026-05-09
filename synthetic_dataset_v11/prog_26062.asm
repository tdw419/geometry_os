; DESCRIPTION: Composite: . Then Creates a white circular shape at (70, 169) with radius 58. Then Places a cyan line segment connecting (37, 27) to (221, 87).
; PLAN: r0=70(x), r1=169(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=37(x1), r1=27(y1), r2=221(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a white circular shape at (70, 169) with radius 58.
; PLAN: r0=70(x), r1=169(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 169
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan line segment connecting (37, 27) to (221, 87).
; PLAN: r0=37(x1), r1=27(y1), r2=221(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 27
LDI r2, 221
LDI r3, 87
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
