; DESCRIPTION: Composite: . Then Renders a yellow line between points (127, 52) and (226, 95). Then Places a blue 61x34 rectangle at position (56, 219).
; PLAN: r0=127(x1), r1=52(y1), r2=226(x2), r3=95(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=56(x), r1=219(y), r2=61(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow line between points (127, 52) and (226, 95).
; PLAN: r0=127(x1), r1=52(y1), r2=226(x2), r3=95(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 52
LDI r2, 226
LDI r3, 95
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue 61x34 rectangle at position (56, 219).
; PLAN: r0=56(x), r1=219(y), r2=61(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 219
LDI r2, 61
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
