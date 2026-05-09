; DESCRIPTION: Composite: . Then Renders a cyan box of size 63x84 starting at (129, 1). Then Draws a yellow line from (140, 91) to (54, 153).
; PLAN: r0=129(x), r1=1(y), r2=63(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=140(x1), r1=91(y1), r2=54(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan box of size 63x84 starting at (129, 1).
; PLAN: r0=129(x), r1=1(y), r2=63(width), r3=84(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 1
LDI r2, 63
LDI r3, 84
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow line from (140, 91) to (54, 153).
; PLAN: r0=140(x1), r1=91(y1), r2=54(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 91
LDI r2, 54
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
