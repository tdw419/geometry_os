; DESCRIPTION: Composite: . Then Renders a yellow box of size 98x111 starting at (12, 66). Then Draws a green line from (94, 172) to (202, 248).
; PLAN: r0=12(x), r1=66(y), r2=98(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=94(x1), r1=172(y1), r2=202(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow box of size 98x111 starting at (12, 66).
; PLAN: r0=12(x), r1=66(y), r2=98(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 66
LDI r2, 98
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green line from (94, 172) to (202, 248).
; PLAN: r0=94(x1), r1=172(y1), r2=202(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 172
LDI r2, 202
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
