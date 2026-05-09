; DESCRIPTION: Composite: . Then Draws a cyan line from (100, 25) to (254, 209). Then Draws a green rectangle at (81, 108) with width 34 and height 81.
; PLAN: r0=100(x1), r1=25(y1), r2=254(x2), r3=209(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=81(x), r1=108(y), r2=34(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan line from (100, 25) to (254, 209).
; PLAN: r0=100(x1), r1=25(y1), r2=254(x2), r3=209(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 25
LDI r2, 254
LDI r3, 209
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green rectangle at (81, 108) with width 34 and height 81.
; PLAN: r0=81(x), r1=108(y), r2=34(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 108
LDI r2, 34
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
