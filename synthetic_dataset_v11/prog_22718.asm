; DESCRIPTION: Composite: . Then Renders a orange box of size 17x56 starting at (52, 101). Then Draws a blue line from (36, 66) to (98, 44).
; PLAN: r0=52(x), r1=101(y), r2=17(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=36(x1), r1=66(y1), r2=98(x2), r3=44(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange box of size 17x56 starting at (52, 101).
; PLAN: r0=52(x), r1=101(y), r2=17(width), r3=56(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 101
LDI r2, 17
LDI r3, 56
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue line from (36, 66) to (98, 44).
; PLAN: r0=36(x1), r1=66(y1), r2=98(x2), r3=44(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 66
LDI r2, 98
LDI r3, 44
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
