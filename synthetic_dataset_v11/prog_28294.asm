; DESCRIPTION: Composite: . Then Draws a yellow line from (48, 242) to (84, 193). Then Creates a green rectangular region at (95, 89) spanning 89 by 33 pixels.
; PLAN: r0=48(x1), r1=242(y1), r2=84(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=95(x), r1=89(y), r2=89(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a yellow line from (48, 242) to (84, 193).
; PLAN: r0=48(x1), r1=242(y1), r2=84(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 242
LDI r2, 84
LDI r3, 193
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a green rectangular region at (95, 89) spanning 89 by 33 pixels.
; PLAN: r0=95(x), r1=89(y), r2=89(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 89
LDI r2, 89
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
