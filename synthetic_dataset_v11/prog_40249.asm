; DESCRIPTION: Composite: . Then Creates a magenta rectangular region at (38, 175) spanning 86 by 47 pixels. Then Draws a white line from (117, 29) to (132, 6).
; PLAN: r0=38(x), r1=175(y), r2=86(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=117(x1), r1=29(y1), r2=132(x2), r3=6(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a magenta rectangular region at (38, 175) spanning 86 by 47 pixels.
; PLAN: r0=38(x), r1=175(y), r2=86(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 175
LDI r2, 86
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white line from (117, 29) to (132, 6).
; PLAN: r0=117(x1), r1=29(y1), r2=132(x2), r3=6(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 29
LDI r2, 132
LDI r3, 6
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
