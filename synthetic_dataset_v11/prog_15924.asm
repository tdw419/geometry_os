; DESCRIPTION: Composite: . Then Renders a red box of size 63x52 starting at (54, 63). Then Draws a green line from (173, 98) to (91, 246).
; PLAN: r0=54(x), r1=63(y), r2=63(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=173(x1), r1=98(y1), r2=91(x2), r3=246(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red box of size 63x52 starting at (54, 63).
; PLAN: r0=54(x), r1=63(y), r2=63(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 63
LDI r2, 63
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green line from (173, 98) to (91, 246).
; PLAN: r0=173(x1), r1=98(y1), r2=91(x2), r3=246(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 98
LDI r2, 91
LDI r3, 246
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
