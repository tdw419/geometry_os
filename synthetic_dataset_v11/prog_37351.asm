; DESCRIPTION: Composite: . Then Places a white line segment connecting (96, 187) to (96, 86). Then Renders a magenta box of size 32x22 starting at (31, 113).
; PLAN: r0=96(x1), r1=187(y1), r2=96(x2), r3=86(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=31(x), r1=113(y), r2=32(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white line segment connecting (96, 187) to (96, 86).
; PLAN: r0=96(x1), r1=187(y1), r2=96(x2), r3=86(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 187
LDI r2, 96
LDI r3, 86
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta box of size 32x22 starting at (31, 113).
; PLAN: r0=31(x), r1=113(y), r2=32(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 113
LDI r2, 32
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
