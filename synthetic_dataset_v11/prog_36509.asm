; DESCRIPTION: Composite: . Then Renders a blue line between points (17, 208) and (192, 172). Then Creates a cyan rectangular region at (54, 6) spanning 104 by 92 pixels.
; PLAN: r0=17(x1), r1=208(y1), r2=192(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=54(x), r1=6(y), r2=104(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue line between points (17, 208) and (192, 172).
; PLAN: r0=17(x1), r1=208(y1), r2=192(x2), r3=172(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 208
LDI r2, 192
LDI r3, 172
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a cyan rectangular region at (54, 6) spanning 104 by 92 pixels.
; PLAN: r0=54(x), r1=6(y), r2=104(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 6
LDI r2, 104
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
