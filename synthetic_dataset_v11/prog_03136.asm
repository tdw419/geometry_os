; DESCRIPTION: Composite: . Then Draws a yellow line from (239, 159) to (18, 30). Then Creates a purple rectangular region at (54, 135) spanning 64 by 104 pixels.
; PLAN: r0=239(x1), r1=159(y1), r2=18(x2), r3=30(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=54(x), r1=135(y), r2=64(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a yellow line from (239, 159) to (18, 30).
; PLAN: r0=239(x1), r1=159(y1), r2=18(x2), r3=30(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 159
LDI r2, 18
LDI r3, 30
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a purple rectangular region at (54, 135) spanning 64 by 104 pixels.
; PLAN: r0=54(x), r1=135(y), r2=64(width), r3=104(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 135
LDI r2, 64
LDI r3, 104
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
