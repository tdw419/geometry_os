; DESCRIPTION: Composite: . Then Places a purple circle of radius 63 at center (102, 146). Then Creates a white rectangular region at (28, 48) spanning 93 by 63 pixels.
; PLAN: r0=102(x), r1=146(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=28(x), r1=48(y), r2=93(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple circle of radius 63 at center (102, 146).
; PLAN: r0=102(x), r1=146(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 146
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a white rectangular region at (28, 48) spanning 93 by 63 pixels.
; PLAN: r0=28(x), r1=48(y), r2=93(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 48
LDI r2, 93
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
