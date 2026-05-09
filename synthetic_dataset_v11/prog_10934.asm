; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (66, 72) to (47, 114). Then Creates a blue rectangular region at (168, 152) spanning 67 by 87 pixels.
; PLAN: r0=66(x1), r1=72(y1), r2=47(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=168(x), r1=152(y), r2=67(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow line segment connecting (66, 72) to (47, 114).
; PLAN: r0=66(x1), r1=72(y1), r2=47(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 72
LDI r2, 47
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a blue rectangular region at (168, 152) spanning 67 by 87 pixels.
; PLAN: r0=168(x), r1=152(y), r2=67(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 152
LDI r2, 67
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
