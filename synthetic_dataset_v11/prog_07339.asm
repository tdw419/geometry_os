; DESCRIPTION: Composite: . Then Renders a blue box of size 21x16 starting at (21, 111). Then Draws a yellow line from (74, 72) to (227, 33).
; PLAN: r0=21(x), r1=111(y), r2=21(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=74(x1), r1=72(y1), r2=227(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a blue box of size 21x16 starting at (21, 111).
; PLAN: r0=21(x), r1=111(y), r2=21(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 111
LDI r2, 21
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow line from (74, 72) to (227, 33).
; PLAN: r0=74(x1), r1=72(y1), r2=227(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 72
LDI r2, 227
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
