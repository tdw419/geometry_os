; DESCRIPTION: Composite: . Then Places a red circle of radius 62 at center (79, 113). Then Renders a magenta box of size 77x92 starting at (113, 164).
; PLAN: r0=79(x), r1=113(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=113(x), r1=164(y), r2=77(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red circle of radius 62 at center (79, 113).
; PLAN: r0=79(x), r1=113(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 79
LDI r1, 113
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a magenta box of size 77x92 starting at (113, 164).
; PLAN: r0=113(x), r1=164(y), r2=77(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 164
LDI r2, 77
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
