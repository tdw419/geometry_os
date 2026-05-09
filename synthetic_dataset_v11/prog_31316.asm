; DESCRIPTION: Composite: . Then Draws a red line from (129, 218) to (117, 146). Then Draws a white rectangle at (96, 86) with width 35 and height 91.
; PLAN: r0=129(x1), r1=218(y1), r2=117(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=96(x), r1=86(y), r2=35(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red line from (129, 218) to (117, 146).
; PLAN: r0=129(x1), r1=218(y1), r2=117(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 218
LDI r2, 117
LDI r3, 146
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white rectangle at (96, 86) with width 35 and height 91.
; PLAN: r0=96(x), r1=86(y), r2=35(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 86
LDI r2, 35
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
