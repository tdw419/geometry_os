; DESCRIPTION: Composite: . Then Draws a cyan line from (3, 224) to (137, 190). Then Draws a yellow rectangle at (19, 33) with width 23 and height 40.
; PLAN: r0=3(x1), r1=224(y1), r2=137(x2), r3=190(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=19(x), r1=33(y), r2=23(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan line from (3, 224) to (137, 190).
; PLAN: r0=3(x1), r1=224(y1), r2=137(x2), r3=190(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 224
LDI r2, 137
LDI r3, 190
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow rectangle at (19, 33) with width 23 and height 40.
; PLAN: r0=19(x), r1=33(y), r2=23(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 33
LDI r2, 23
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
