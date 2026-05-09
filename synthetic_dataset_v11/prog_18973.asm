; DESCRIPTION: Composite: . Then Renders a red box of size 39x47 starting at (111, 104). Then Places a magenta line segment connecting (182, 160) to (39, 167).
; PLAN: r0=111(x), r1=104(y), r2=39(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=182(x1), r1=160(y1), r2=39(x2), r3=167(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red box of size 39x47 starting at (111, 104).
; PLAN: r0=111(x), r1=104(y), r2=39(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 104
LDI r2, 39
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta line segment connecting (182, 160) to (39, 167).
; PLAN: r0=182(x1), r1=160(y1), r2=39(x2), r3=167(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 160
LDI r2, 39
LDI r3, 167
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
