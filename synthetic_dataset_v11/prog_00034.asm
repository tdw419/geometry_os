; DESCRIPTION: Composite: . Then Draws a green rectangle at (10, 145) with width 27 and height 23. Then Draws a cyan line from (103, 128) to (153, 77).
; PLAN: r0=10(x), r1=145(y), r2=27(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=103(x1), r1=128(y1), r2=153(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green rectangle at (10, 145) with width 27 and height 23.
; PLAN: r0=10(x), r1=145(y), r2=27(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 145
LDI r2, 27
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a cyan line from (103, 128) to (153, 77).
; PLAN: r0=103(x1), r1=128(y1), r2=153(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 128
LDI r2, 153
LDI r3, 77
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
