; DESCRIPTION: Composite: . Then Creates a orange rectangular region at (180, 110) spanning 38 by 116 pixels. Then Draws a black line from (20, 122) to (128, 137).
; PLAN: r0=180(x), r1=110(y), r2=38(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=20(x1), r1=122(y1), r2=128(x2), r3=137(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a orange rectangular region at (180, 110) spanning 38 by 116 pixels.
; PLAN: r0=180(x), r1=110(y), r2=38(width), r3=116(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 110
LDI r2, 38
LDI r3, 116
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black line from (20, 122) to (128, 137).
; PLAN: r0=20(x1), r1=122(y1), r2=128(x2), r3=137(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 122
LDI r2, 128
LDI r3, 137
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
