; DESCRIPTION: Composite: . Then Renders a yellow box of size 18x102 starting at (128, 72). Then Draws a white line from (91, 8) to (157, 116).
; PLAN: r0=128(x), r1=72(y), r2=18(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=91(x1), r1=8(y1), r2=157(x2), r3=116(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow box of size 18x102 starting at (128, 72).
; PLAN: r0=128(x), r1=72(y), r2=18(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 72
LDI r2, 18
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white line from (91, 8) to (157, 116).
; PLAN: r0=91(x1), r1=8(y1), r2=157(x2), r3=116(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 8
LDI r2, 157
LDI r3, 116
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
