; DESCRIPTION: Composite: . Then Creates a orange rectangular region at (145, 191) spanning 43 by 14 pixels. Then Places a black line segment connecting (75, 205) to (191, 142).
; PLAN: r0=145(x), r1=191(y), r2=43(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=75(x1), r1=205(y1), r2=191(x2), r3=142(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a orange rectangular region at (145, 191) spanning 43 by 14 pixels.
; PLAN: r0=145(x), r1=191(y), r2=43(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 191
LDI r2, 43
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a black line segment connecting (75, 205) to (191, 142).
; PLAN: r0=75(x1), r1=205(y1), r2=191(x2), r3=142(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 205
LDI r2, 191
LDI r3, 142
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
