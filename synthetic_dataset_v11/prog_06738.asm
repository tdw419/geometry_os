; DESCRIPTION: Composite: . Then Creates a yellow rectangular region at (58, 103) spanning 46 by 115 pixels. Then Places a yellow line segment connecting (66, 4) to (83, 65).
; PLAN: r0=58(x), r1=103(y), r2=46(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=66(x1), r1=4(y1), r2=83(x2), r3=65(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a yellow rectangular region at (58, 103) spanning 46 by 115 pixels.
; PLAN: r0=58(x), r1=103(y), r2=46(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 103
LDI r2, 46
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow line segment connecting (66, 4) to (83, 65).
; PLAN: r0=66(x1), r1=4(y1), r2=83(x2), r3=65(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 4
LDI r2, 83
LDI r3, 65
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
