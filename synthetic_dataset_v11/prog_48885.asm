; DESCRIPTION: Composite: . Then Creates a orange rectangular region at (145, 120) spanning 81 by 23 pixels. Then Renders a blue line between points (8, 23) and (101, 243).
; PLAN: r0=145(x), r1=120(y), r2=81(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=8(x1), r1=23(y1), r2=101(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a orange rectangular region at (145, 120) spanning 81 by 23 pixels.
; PLAN: r0=145(x), r1=120(y), r2=81(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 120
LDI r2, 81
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue line between points (8, 23) and (101, 243).
; PLAN: r0=8(x1), r1=23(y1), r2=101(x2), r3=243(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 23
LDI r2, 101
LDI r3, 243
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
