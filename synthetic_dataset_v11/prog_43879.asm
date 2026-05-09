; DESCRIPTION: Composite: . Then Draws a black line from (216, 27) to (199, 64). Then Creates a cyan rectangular region at (13, 8) spanning 110 by 38 pixels.
; PLAN: r0=216(x1), r1=27(y1), r2=199(x2), r3=64(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=13(x), r1=8(y), r2=110(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black line from (216, 27) to (199, 64).
; PLAN: r0=216(x1), r1=27(y1), r2=199(x2), r3=64(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 27
LDI r2, 199
LDI r3, 64
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a cyan rectangular region at (13, 8) spanning 110 by 38 pixels.
; PLAN: r0=13(x), r1=8(y), r2=110(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 8
LDI r2, 110
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
