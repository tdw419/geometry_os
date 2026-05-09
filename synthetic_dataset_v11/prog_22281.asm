; DESCRIPTION: Composite: . Then Draws a yellow rectangle at (15, 98) with width 45 and height 107. Then Draws a green line from (168, 81) to (160, 231).
; PLAN: r0=15(x), r1=98(y), r2=45(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=168(x1), r1=81(y1), r2=160(x2), r3=231(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a yellow rectangle at (15, 98) with width 45 and height 107.
; PLAN: r0=15(x), r1=98(y), r2=45(width), r3=107(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 98
LDI r2, 45
LDI r3, 107
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green line from (168, 81) to (160, 231).
; PLAN: r0=168(x1), r1=81(y1), r2=160(x2), r3=231(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 81
LDI r2, 160
LDI r3, 231
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
