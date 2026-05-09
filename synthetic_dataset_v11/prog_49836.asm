; DESCRIPTION: Composite: . Then Creates a purple rectangular region at (66, 59) spanning 14 by 50 pixels. Then Places a green line segment connecting (167, 147) to (234, 125).
; PLAN: r0=66(x), r1=59(y), r2=14(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=167(x1), r1=147(y1), r2=234(x2), r3=125(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a purple rectangular region at (66, 59) spanning 14 by 50 pixels.
; PLAN: r0=66(x), r1=59(y), r2=14(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 59
LDI r2, 14
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green line segment connecting (167, 147) to (234, 125).
; PLAN: r0=167(x1), r1=147(y1), r2=234(x2), r3=125(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 147
LDI r2, 234
LDI r3, 125
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
