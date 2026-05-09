; DESCRIPTION: Composite: . Then Renders a purple line between points (152, 10) and (191, 22). Then Creates a cyan rectangular region at (8, 178) spanning 96 by 54 pixels.
; PLAN: r0=152(x1), r1=10(y1), r2=191(x2), r3=22(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=8(x), r1=178(y), r2=96(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple line between points (152, 10) and (191, 22).
; PLAN: r0=152(x1), r1=10(y1), r2=191(x2), r3=22(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 10
LDI r2, 191
LDI r3, 22
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a cyan rectangular region at (8, 178) spanning 96 by 54 pixels.
; PLAN: r0=8(x), r1=178(y), r2=96(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 178
LDI r2, 96
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
