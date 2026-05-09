; DESCRIPTION: Composite: . Then Draws a orange line from (213, 210) to (222, 248). Then Creates a green rectangular region at (86, 144) spanning 57 by 65 pixels.
; PLAN: r0=213(x1), r1=210(y1), r2=222(x2), r3=248(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=86(x), r1=144(y), r2=57(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange line from (213, 210) to (222, 248).
; PLAN: r0=213(x1), r1=210(y1), r2=222(x2), r3=248(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 210
LDI r2, 222
LDI r3, 248
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a green rectangular region at (86, 144) spanning 57 by 65 pixels.
; PLAN: r0=86(x), r1=144(y), r2=57(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 144
LDI r2, 57
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
