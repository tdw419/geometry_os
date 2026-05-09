; DESCRIPTION: Composite: . Then Renders a black line between points (16, 101) and (140, 215). Then Renders a magenta box of size 36x94 starting at (55, 64).
; PLAN: r0=16(x1), r1=101(y1), r2=140(x2), r3=215(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=55(x), r1=64(y), r2=36(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black line between points (16, 101) and (140, 215).
; PLAN: r0=16(x1), r1=101(y1), r2=140(x2), r3=215(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 101
LDI r2, 140
LDI r3, 215
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta box of size 36x94 starting at (55, 64).
; PLAN: r0=55(x), r1=64(y), r2=36(width), r3=94(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 64
LDI r2, 36
LDI r3, 94
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
