; DESCRIPTION: Composite: . Then Renders a white line between points (187, 220) and (27, 113). Then Draws a yellow rectangle at (130, 159) with width 80 and height 93.
; PLAN: r0=187(x1), r1=220(y1), r2=27(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=130(x), r1=159(y), r2=80(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white line between points (187, 220) and (27, 113).
; PLAN: r0=187(x1), r1=220(y1), r2=27(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 220
LDI r2, 27
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow rectangle at (130, 159) with width 80 and height 93.
; PLAN: r0=130(x), r1=159(y), r2=80(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 159
LDI r2, 80
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
