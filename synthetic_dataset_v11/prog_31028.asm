; DESCRIPTION: Composite: . Then Draws a white line from (35, 117) to (192, 14). Then Draws a cyan circle centered at (114, 99) with radius 61.
; PLAN: r0=35(x1), r1=117(y1), r2=192(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=114(x), r1=99(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a white line from (35, 117) to (192, 14).
; PLAN: r0=35(x1), r1=117(y1), r2=192(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 117
LDI r2, 192
LDI r3, 14
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a cyan circle centered at (114, 99) with radius 61.
; PLAN: r0=114(x), r1=99(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 99
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
