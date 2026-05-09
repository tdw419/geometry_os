; DESCRIPTION: Composite: . Then Creates a purple rectangular region at (12, 180) spanning 13 by 38 pixels. Then Draws a magenta line from (128, 91) to (199, 34).
; PLAN: r0=12(x), r1=180(y), r2=13(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=128(x1), r1=91(y1), r2=199(x2), r3=34(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a purple rectangular region at (12, 180) spanning 13 by 38 pixels.
; PLAN: r0=12(x), r1=180(y), r2=13(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 180
LDI r2, 13
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta line from (128, 91) to (199, 34).
; PLAN: r0=128(x1), r1=91(y1), r2=199(x2), r3=34(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 91
LDI r2, 199
LDI r3, 34
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
