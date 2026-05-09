; DESCRIPTION: Composite: . Then Draws a blue line from (199, 243) to (24, 202). Then Renders a green box of size 95x19 starting at (128, 133).
; PLAN: r0=199(x1), r1=243(y1), r2=24(x2), r3=202(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=128(x), r1=133(y), r2=95(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue line from (199, 243) to (24, 202).
; PLAN: r0=199(x1), r1=243(y1), r2=24(x2), r3=202(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 243
LDI r2, 24
LDI r3, 202
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green box of size 95x19 starting at (128, 133).
; PLAN: r0=128(x), r1=133(y), r2=95(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 133
LDI r2, 95
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
