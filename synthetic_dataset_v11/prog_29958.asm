; DESCRIPTION: Composite: . Then Creates a white circular shape at (179, 193) with radius 62. Then Draws a orange line from (23, 194) to (22, 186).
; PLAN: r0=179(x), r1=193(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=23(x1), r1=194(y1), r2=22(x2), r3=186(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a white circular shape at (179, 193) with radius 62.
; PLAN: r0=179(x), r1=193(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 179
LDI r1, 193
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a orange line from (23, 194) to (22, 186).
; PLAN: r0=23(x1), r1=194(y1), r2=22(x2), r3=186(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 194
LDI r2, 22
LDI r3, 186
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
