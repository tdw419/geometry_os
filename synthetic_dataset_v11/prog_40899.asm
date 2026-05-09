; DESCRIPTION: Composite: . Then Creates a cyan rectangular region at (58, 158) spanning 110 by 10 pixels. Then Places a green line segment connecting (177, 156) to (91, 238).
; PLAN: r0=58(x), r1=158(y), r2=110(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=177(x1), r1=156(y1), r2=91(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a cyan rectangular region at (58, 158) spanning 110 by 10 pixels.
; PLAN: r0=58(x), r1=158(y), r2=110(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 158
LDI r2, 110
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green line segment connecting (177, 156) to (91, 238).
; PLAN: r0=177(x1), r1=156(y1), r2=91(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 156
LDI r2, 91
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
