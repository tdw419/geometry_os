; DESCRIPTION: Composite: . Then Creates a purple rectangular region at (46, 158) spanning 56 by 78 pixels. Then Draws a white line from (187, 254) to (8, 27).
; PLAN: r0=46(x), r1=158(y), r2=56(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=187(x1), r1=254(y1), r2=8(x2), r3=27(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a purple rectangular region at (46, 158) spanning 56 by 78 pixels.
; PLAN: r0=46(x), r1=158(y), r2=56(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 158
LDI r2, 56
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white line from (187, 254) to (8, 27).
; PLAN: r0=187(x1), r1=254(y1), r2=8(x2), r3=27(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 254
LDI r2, 8
LDI r3, 27
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
