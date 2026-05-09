; DESCRIPTION: Composite: . Then Renders a blue box of size 113x13 starting at (100, 148). Then Draws a cyan line from (174, 28) to (189, 39).
; PLAN: r0=100(x), r1=148(y), r2=113(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=174(x1), r1=28(y1), r2=189(x2), r3=39(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue box of size 113x13 starting at (100, 148).
; PLAN: r0=100(x), r1=148(y), r2=113(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 148
LDI r2, 113
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a cyan line from (174, 28) to (189, 39).
; PLAN: r0=174(x1), r1=28(y1), r2=189(x2), r3=39(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 28
LDI r2, 189
LDI r3, 39
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
