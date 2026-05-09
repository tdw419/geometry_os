; DESCRIPTION: Composite: . Then Creates a cyan circular shape at (207, 102) with radius 33. Then Draws a cyan line from (162, 21) to (21, 176).
; PLAN: r0=207(x), r1=102(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=162(x1), r1=21(y1), r2=21(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a cyan circular shape at (207, 102) with radius 33.
; PLAN: r0=207(x), r1=102(y), r2=33(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 102
LDI r2, 33
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a cyan line from (162, 21) to (21, 176).
; PLAN: r0=162(x1), r1=21(y1), r2=21(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 21
LDI r2, 21
LDI r3, 176
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
