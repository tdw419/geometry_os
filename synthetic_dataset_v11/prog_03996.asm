; DESCRIPTION: Composite: . Then Draws a red line from (240, 12) to (167, 84). Then Renders a magenta box of size 12x38 starting at (193, 55).
; PLAN: r0=240(x1), r1=12(y1), r2=167(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=193(x), r1=55(y), r2=12(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red line from (240, 12) to (167, 84).
; PLAN: r0=240(x1), r1=12(y1), r2=167(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 12
LDI r2, 167
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta box of size 12x38 starting at (193, 55).
; PLAN: r0=193(x), r1=55(y), r2=12(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 55
LDI r2, 12
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
