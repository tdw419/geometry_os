; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (197, 208) to (238, 232). Then Draws a blue rectangle at (38, 95) with width 76 and height 95.
; PLAN: r0=197(x1), r1=208(y1), r2=238(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=38(x), r1=95(y), r2=76(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan line segment connecting (197, 208) to (238, 232).
; PLAN: r0=197(x1), r1=208(y1), r2=238(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 208
LDI r2, 238
LDI r3, 232
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue rectangle at (38, 95) with width 76 and height 95.
; PLAN: r0=38(x), r1=95(y), r2=76(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 95
LDI r2, 76
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
