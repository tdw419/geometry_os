; DESCRIPTION: Composite: . Then Creates a orange circular shape at (49, 139) with radius 22. Then Draws a green line from (220, 50) to (28, 209).
; PLAN: r0=49(x), r1=139(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=220(x1), r1=50(y1), r2=28(x2), r3=209(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a orange circular shape at (49, 139) with radius 22.
; PLAN: r0=49(x), r1=139(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 49
LDI r1, 139
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a green line from (220, 50) to (28, 209).
; PLAN: r0=220(x1), r1=50(y1), r2=28(x2), r3=209(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 50
LDI r2, 28
LDI r3, 209
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
