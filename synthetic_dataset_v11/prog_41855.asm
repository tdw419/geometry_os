; DESCRIPTION: Composite: . Then Places a white line segment connecting (213, 231) to (89, 196). Then Draws a blue rectangle at (119, 190) with width 42 and height 55.
; PLAN: r0=213(x1), r1=231(y1), r2=89(x2), r3=196(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=119(x), r1=190(y), r2=42(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white line segment connecting (213, 231) to (89, 196).
; PLAN: r0=213(x1), r1=231(y1), r2=89(x2), r3=196(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 231
LDI r2, 89
LDI r3, 196
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue rectangle at (119, 190) with width 42 and height 55.
; PLAN: r0=119(x), r1=190(y), r2=42(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 190
LDI r2, 42
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
