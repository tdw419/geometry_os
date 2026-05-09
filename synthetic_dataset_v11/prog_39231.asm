; DESCRIPTION: Composite: . Then Places a white line segment connecting (237, 46) to (40, 19). Then Creates a purple rectangular region at (123, 2) spanning 120 by 10 pixels.
; PLAN: r0=237(x1), r1=46(y1), r2=40(x2), r3=19(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=123(x), r1=2(y), r2=120(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white line segment connecting (237, 46) to (40, 19).
; PLAN: r0=237(x1), r1=46(y1), r2=40(x2), r3=19(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 46
LDI r2, 40
LDI r3, 19
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple rectangular region at (123, 2) spanning 120 by 10 pixels.
; PLAN: r0=123(x), r1=2(y), r2=120(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 2
LDI r2, 120
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
