; DESCRIPTION: Composite: . Then Draws a cyan line from (64, 3) to (94, 51). Then Draws a yellow rectangle at (24, 117) with width 49 and height 87.
; PLAN: r0=64(x1), r1=3(y1), r2=94(x2), r3=51(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=24(x), r1=117(y), r2=49(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan line from (64, 3) to (94, 51).
; PLAN: r0=64(x1), r1=3(y1), r2=94(x2), r3=51(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 3
LDI r2, 94
LDI r3, 51
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow rectangle at (24, 117) with width 49 and height 87.
; PLAN: r0=24(x), r1=117(y), r2=49(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 117
LDI r2, 49
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
