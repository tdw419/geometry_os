; DESCRIPTION: Composite: . Then Draws a red line from (49, 96) to (203, 186). Then Renders a yellow box of size 12x37 starting at (24, 128).
; PLAN: r0=49(x1), r1=96(y1), r2=203(x2), r3=186(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=24(x), r1=128(y), r2=12(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red line from (49, 96) to (203, 186).
; PLAN: r0=49(x1), r1=96(y1), r2=203(x2), r3=186(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 96
LDI r2, 203
LDI r3, 186
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow box of size 12x37 starting at (24, 128).
; PLAN: r0=24(x), r1=128(y), r2=12(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 128
LDI r2, 12
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
