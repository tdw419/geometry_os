; DESCRIPTION: Composite: . Then Creates a red rectangular region at (5, 139) spanning 92 by 18 pixels. Then Draws a blue line from (229, 197) to (175, 142).
; PLAN: r0=5(x), r1=139(y), r2=92(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=229(x1), r1=197(y1), r2=175(x2), r3=142(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a red rectangular region at (5, 139) spanning 92 by 18 pixels.
; PLAN: r0=5(x), r1=139(y), r2=92(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 139
LDI r2, 92
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue line from (229, 197) to (175, 142).
; PLAN: r0=229(x1), r1=197(y1), r2=175(x2), r3=142(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 197
LDI r2, 175
LDI r3, 142
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
