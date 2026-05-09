; DESCRIPTION: Composite: . Then Creates a purple rectangular region at (164, 131) spanning 57 by 117 pixels. Then Draws a green circle centered at (143, 111) with radius 78.
; PLAN: r0=164(x), r1=131(y), r2=57(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=143(x), r1=111(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a purple rectangular region at (164, 131) spanning 57 by 117 pixels.
; PLAN: r0=164(x), r1=131(y), r2=57(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 131
LDI r2, 57
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green circle centered at (143, 111) with radius 78.
; PLAN: r0=143(x), r1=111(y), r2=78(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 143
LDI r1, 111
LDI r2, 78
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
