; DESCRIPTION: Composite: . Then Places a red circle of radius 66 at center (146, 92). Then Draws a green rectangle at (50, 169) with width 93 and height 13.
; PLAN: r0=146(x), r1=92(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=50(x), r1=169(y), r2=93(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red circle of radius 66 at center (146, 92).
; PLAN: r0=146(x), r1=92(y), r2=66(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 92
LDI r2, 66
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a green rectangle at (50, 169) with width 93 and height 13.
; PLAN: r0=50(x), r1=169(y), r2=93(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 169
LDI r2, 93
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
