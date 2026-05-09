; DESCRIPTION: Composite: . Then Renders a green box of size 65x51 starting at (158, 129). Then Draws a magenta line from (253, 96) to (173, 221).
; PLAN: r0=158(x), r1=129(y), r2=65(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=253(x1), r1=96(y1), r2=173(x2), r3=221(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green box of size 65x51 starting at (158, 129).
; PLAN: r0=158(x), r1=129(y), r2=65(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 129
LDI r2, 65
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta line from (253, 96) to (173, 221).
; PLAN: r0=253(x1), r1=96(y1), r2=173(x2), r3=221(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 96
LDI r2, 173
LDI r3, 221
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
