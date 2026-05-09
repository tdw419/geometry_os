; DESCRIPTION: Composite: . Then Renders a white box of size 100x107 starting at (68, 95). Then Draws a green line from (248, 91) to (61, 135).
; PLAN: r0=68(x), r1=95(y), r2=100(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=248(x1), r1=91(y1), r2=61(x2), r3=135(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white box of size 100x107 starting at (68, 95).
; PLAN: r0=68(x), r1=95(y), r2=100(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 95
LDI r2, 100
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green line from (248, 91) to (61, 135).
; PLAN: r0=248(x1), r1=91(y1), r2=61(x2), r3=135(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 91
LDI r2, 61
LDI r3, 135
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
