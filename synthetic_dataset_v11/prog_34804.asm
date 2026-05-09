; DESCRIPTION: Composite: . Then Draws a black line from (199, 137) to (63, 52). Then Draws a yellow rectangle at (154, 116) with width 71 and height 45.
; PLAN: r0=199(x1), r1=137(y1), r2=63(x2), r3=52(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=154(x), r1=116(y), r2=71(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black line from (199, 137) to (63, 52).
; PLAN: r0=199(x1), r1=137(y1), r2=63(x2), r3=52(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 137
LDI r2, 63
LDI r3, 52
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow rectangle at (154, 116) with width 71 and height 45.
; PLAN: r0=154(x), r1=116(y), r2=71(width), r3=45(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 116
LDI r2, 71
LDI r3, 45
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
