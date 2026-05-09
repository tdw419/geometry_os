; DESCRIPTION: Composite: . Then Draws a black line from (43, 61) to (180, 169). Then Creates a purple rectangular region at (206, 187) spanning 22 by 24 pixels.
; PLAN: r0=43(x1), r1=61(y1), r2=180(x2), r3=169(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=206(x), r1=187(y), r2=22(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black line from (43, 61) to (180, 169).
; PLAN: r0=43(x1), r1=61(y1), r2=180(x2), r3=169(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 61
LDI r2, 180
LDI r3, 169
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple rectangular region at (206, 187) spanning 22 by 24 pixels.
; PLAN: r0=206(x), r1=187(y), r2=22(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 187
LDI r2, 22
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
