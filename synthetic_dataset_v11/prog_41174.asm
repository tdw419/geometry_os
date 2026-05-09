; DESCRIPTION: Composite: . Then Draws a black line from (143, 55) to (245, 105). Then Places a blue 71x43 rectangle at position (180, 33).
; PLAN: r0=143(x1), r1=55(y1), r2=245(x2), r3=105(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=180(x), r1=33(y), r2=71(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black line from (143, 55) to (245, 105).
; PLAN: r0=143(x1), r1=55(y1), r2=245(x2), r3=105(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 55
LDI r2, 245
LDI r3, 105
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue 71x43 rectangle at position (180, 33).
; PLAN: r0=180(x), r1=33(y), r2=71(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 33
LDI r2, 71
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
