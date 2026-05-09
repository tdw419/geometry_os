; DESCRIPTION: Composite: . Then Renders a green line between points (197, 122) and (127, 66). Then Draws a white rectangle at (25, 86) with width 46 and height 32.
; PLAN: r0=197(x1), r1=122(y1), r2=127(x2), r3=66(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=25(x), r1=86(y), r2=46(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green line between points (197, 122) and (127, 66).
; PLAN: r0=197(x1), r1=122(y1), r2=127(x2), r3=66(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 122
LDI r2, 127
LDI r3, 66
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white rectangle at (25, 86) with width 46 and height 32.
; PLAN: r0=25(x), r1=86(y), r2=46(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 86
LDI r2, 46
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
