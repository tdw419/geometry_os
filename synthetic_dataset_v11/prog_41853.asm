; DESCRIPTION: Composite: . Then Renders a blue box of size 83x96 starting at (103, 152). Then Draws a cyan line from (177, 223) to (44, 141).
; PLAN: r0=103(x), r1=152(y), r2=83(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=177(x1), r1=223(y1), r2=44(x2), r3=141(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue box of size 83x96 starting at (103, 152).
; PLAN: r0=103(x), r1=152(y), r2=83(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 152
LDI r2, 83
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a cyan line from (177, 223) to (44, 141).
; PLAN: r0=177(x1), r1=223(y1), r2=44(x2), r3=141(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 223
LDI r2, 44
LDI r3, 141
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
