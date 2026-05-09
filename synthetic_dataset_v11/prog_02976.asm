; DESCRIPTION: Composite: . Then Renders a orange box of size 120x20 starting at (99, 106). Then Places a blue line segment connecting (82, 195) to (104, 138).
; PLAN: r0=99(x), r1=106(y), r2=120(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=82(x1), r1=195(y1), r2=104(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange box of size 120x20 starting at (99, 106).
; PLAN: r0=99(x), r1=106(y), r2=120(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 106
LDI r2, 120
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue line segment connecting (82, 195) to (104, 138).
; PLAN: r0=82(x1), r1=195(y1), r2=104(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 195
LDI r2, 104
LDI r3, 138
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
