; DESCRIPTION: Composite: . Then Creates a magenta rectangular region at (140, 93) spanning 22 by 90 pixels. Then Creates a white circular shape at (140, 205) with radius 38.
; PLAN: r0=140(x), r1=93(y), r2=22(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=140(x), r1=205(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a magenta rectangular region at (140, 93) spanning 22 by 90 pixels.
; PLAN: r0=140(x), r1=93(y), r2=22(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 93
LDI r2, 22
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a white circular shape at (140, 205) with radius 38.
; PLAN: r0=140(x), r1=205(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 205
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
