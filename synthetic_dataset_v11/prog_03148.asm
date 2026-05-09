; DESCRIPTION: Composite: . Then Creates a white rectangular region at (101, 79) spanning 43 by 92 pixels. Then Renders a green disk with center (176, 86) and radius 61.
; PLAN: r0=101(x), r1=79(y), r2=43(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=176(x), r1=86(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a white rectangular region at (101, 79) spanning 43 by 92 pixels.
; PLAN: r0=101(x), r1=79(y), r2=43(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 79
LDI r2, 43
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a green disk with center (176, 86) and radius 61.
; PLAN: r0=176(x), r1=86(y), r2=61(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 86
LDI r2, 61
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
