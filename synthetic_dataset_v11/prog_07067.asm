; DESCRIPTION: Composite: . Then Renders a red box of size 70x67 starting at (106, 127). Then Places a blue circle of radius 59 at center (113, 91).
; PLAN: r0=106(x), r1=127(y), r2=70(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=113(x), r1=91(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a red box of size 70x67 starting at (106, 127).
; PLAN: r0=106(x), r1=127(y), r2=70(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 127
LDI r2, 70
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue circle of radius 59 at center (113, 91).
; PLAN: r0=113(x), r1=91(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 91
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
