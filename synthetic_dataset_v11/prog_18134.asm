; DESCRIPTION: Composite: . Then Creates a cyan rectangular region at (122, 77) spanning 34 by 44 pixels. Then Draws a magenta line from (141, 251) to (186, 159).
; PLAN: r0=122(x), r1=77(y), r2=34(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=141(x1), r1=251(y1), r2=186(x2), r3=159(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a cyan rectangular region at (122, 77) spanning 34 by 44 pixels.
; PLAN: r0=122(x), r1=77(y), r2=34(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 77
LDI r2, 34
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta line from (141, 251) to (186, 159).
; PLAN: r0=141(x1), r1=251(y1), r2=186(x2), r3=159(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 251
LDI r2, 186
LDI r3, 159
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
