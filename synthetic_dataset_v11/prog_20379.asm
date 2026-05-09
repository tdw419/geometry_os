; DESCRIPTION: Composite: . Then Renders a green box of size 10x99 starting at (173, 48). Then Renders a white line between points (1, 37) and (93, 54).
; PLAN: r0=173(x), r1=48(y), r2=10(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=1(x1), r1=37(y1), r2=93(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green box of size 10x99 starting at (173, 48).
; PLAN: r0=173(x), r1=48(y), r2=10(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 48
LDI r2, 10
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a white line between points (1, 37) and (93, 54).
; PLAN: r0=1(x1), r1=37(y1), r2=93(x2), r3=54(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 37
LDI r2, 93
LDI r3, 54
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
