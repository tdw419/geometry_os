; DESCRIPTION: Composite: . Then Renders a magenta box of size 116x86 starting at (80, 33). Then Places a red line segment connecting (165, 29) to (7, 84).
; PLAN: r0=80(x), r1=33(y), r2=116(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=165(x1), r1=29(y1), r2=7(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta box of size 116x86 starting at (80, 33).
; PLAN: r0=80(x), r1=33(y), r2=116(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 33
LDI r2, 116
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red line segment connecting (165, 29) to (7, 84).
; PLAN: r0=165(x1), r1=29(y1), r2=7(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 29
LDI r2, 7
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
