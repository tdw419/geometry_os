; DESCRIPTION: Composite: . Then Renders a white box of size 91x86 starting at (107, 151). Then Draws a magenta line from (99, 25) to (107, 125).
; PLAN: r0=107(x), r1=151(y), r2=91(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=99(x1), r1=25(y1), r2=107(x2), r3=125(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white box of size 91x86 starting at (107, 151).
; PLAN: r0=107(x), r1=151(y), r2=91(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 151
LDI r2, 91
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a magenta line from (99, 25) to (107, 125).
; PLAN: r0=99(x1), r1=25(y1), r2=107(x2), r3=125(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 25
LDI r2, 107
LDI r3, 125
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
