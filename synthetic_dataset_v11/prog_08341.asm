; DESCRIPTION: Composite: . Then Draws a yellow rectangle at (119, 38) with width 42 and height 81. Then Renders a red line between points (207, 42) and (197, 58).
; PLAN: r0=119(x), r1=38(y), r2=42(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=207(x1), r1=42(y1), r2=197(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a yellow rectangle at (119, 38) with width 42 and height 81.
; PLAN: r0=119(x), r1=38(y), r2=42(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 38
LDI r2, 42
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red line between points (207, 42) and (197, 58).
; PLAN: r0=207(x1), r1=42(y1), r2=197(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 42
LDI r2, 197
LDI r3, 58
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
