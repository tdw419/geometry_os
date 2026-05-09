; DESCRIPTION: Composite: . Then Places a red 30x20 rectangle at position (28, 25). Then Draws a white line from (86, 39) to (188, 4).
; PLAN: r0=28(x), r1=25(y), r2=30(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=86(x1), r1=39(y1), r2=188(x2), r3=4(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red 30x20 rectangle at position (28, 25).
; PLAN: r0=28(x), r1=25(y), r2=30(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 25
LDI r2, 30
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white line from (86, 39) to (188, 4).
; PLAN: r0=86(x1), r1=39(y1), r2=188(x2), r3=4(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 39
LDI r2, 188
LDI r3, 4
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
