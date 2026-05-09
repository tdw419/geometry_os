; DESCRIPTION: Composite: . Then Places a red circle of radius 79 at center (143, 165). Then Creates a magenta rectangular region at (74, 38) spanning 57 by 107 pixels.
; PLAN: r0=143(x), r1=165(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=74(x), r1=38(y), r2=57(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red circle of radius 79 at center (143, 165).
; PLAN: r0=143(x), r1=165(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 165
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a magenta rectangular region at (74, 38) spanning 57 by 107 pixels.
; PLAN: r0=74(x), r1=38(y), r2=57(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 38
LDI r2, 57
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
