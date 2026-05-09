; DESCRIPTION: Composite: . Then Draws a white line from (220, 40) to (170, 223). Then Draws a magenta rectangle at (138, 215) with width 25 and height 32.
; PLAN: r0=220(x1), r1=40(y1), r2=170(x2), r3=223(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=138(x), r1=215(y), r2=25(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white line from (220, 40) to (170, 223).
; PLAN: r0=220(x1), r1=40(y1), r2=170(x2), r3=223(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 40
LDI r2, 170
LDI r3, 223
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta rectangle at (138, 215) with width 25 and height 32.
; PLAN: r0=138(x), r1=215(y), r2=25(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 215
LDI r2, 25
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
