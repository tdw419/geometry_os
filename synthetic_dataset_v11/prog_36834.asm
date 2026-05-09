; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (90, 134) to (206, 27). Then Renders a blue box of size 44x78 starting at (167, 84).
; PLAN: r0=90(x1), r1=134(y1), r2=206(x2), r3=27(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=167(x), r1=84(y), r2=44(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan line segment connecting (90, 134) to (206, 27).
; PLAN: r0=90(x1), r1=134(y1), r2=206(x2), r3=27(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 134
LDI r2, 206
LDI r3, 27
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue box of size 44x78 starting at (167, 84).
; PLAN: r0=167(x), r1=84(y), r2=44(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 84
LDI r2, 44
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
