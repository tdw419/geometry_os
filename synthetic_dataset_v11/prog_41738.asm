; DESCRIPTION: Composite: . Then Draws a red rectangle at (21, 148) with width 61 and height 86. Then Draws a green line from (246, 245) to (100, 9).
; PLAN: r0=21(x), r1=148(y), r2=61(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=246(x1), r1=245(y1), r2=100(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red rectangle at (21, 148) with width 61 and height 86.
; PLAN: r0=21(x), r1=148(y), r2=61(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 148
LDI r2, 61
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green line from (246, 245) to (100, 9).
; PLAN: r0=246(x1), r1=245(y1), r2=100(x2), r3=9(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 245
LDI r2, 100
LDI r3, 9
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
