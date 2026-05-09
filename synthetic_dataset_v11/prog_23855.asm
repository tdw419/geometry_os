; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (246, 28) to (213, 76). Then Draws a red rectangle at (166, 52) with width 64 and height 23.
; PLAN: r0=246(x1), r1=28(y1), r2=213(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=166(x), r1=52(y), r2=64(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan line segment connecting (246, 28) to (213, 76).
; PLAN: r0=246(x1), r1=28(y1), r2=213(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 28
LDI r2, 213
LDI r3, 76
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red rectangle at (166, 52) with width 64 and height 23.
; PLAN: r0=166(x), r1=52(y), r2=64(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 52
LDI r2, 64
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
