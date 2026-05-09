; DESCRIPTION: Composite: . Then Creates a cyan circular shape at (144, 78) with radius 57. Then Draws a yellow line from (14, 187) to (117, 248).
; PLAN: r0=144(x), r1=78(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=14(x1), r1=187(y1), r2=117(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a cyan circular shape at (144, 78) with radius 57.
; PLAN: r0=144(x), r1=78(y), r2=57(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 78
LDI r2, 57
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a yellow line from (14, 187) to (117, 248).
; PLAN: r0=14(x1), r1=187(y1), r2=117(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 187
LDI r2, 117
LDI r3, 248
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
