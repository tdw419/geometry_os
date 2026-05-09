; DESCRIPTION: Composite: . Then Draws a blue line from (162, 166) to (59, 30). Then Creates a cyan rectangular region at (73, 83) spanning 100 by 16 pixels.
; PLAN: r0=162(x1), r1=166(y1), r2=59(x2), r3=30(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=73(x), r1=83(y), r2=100(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue line from (162, 166) to (59, 30).
; PLAN: r0=162(x1), r1=166(y1), r2=59(x2), r3=30(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 166
LDI r2, 59
LDI r3, 30
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a cyan rectangular region at (73, 83) spanning 100 by 16 pixels.
; PLAN: r0=73(x), r1=83(y), r2=100(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 83
LDI r2, 100
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
