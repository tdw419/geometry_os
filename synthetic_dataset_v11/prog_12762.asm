; DESCRIPTION: Composite: . Then Creates a green circular shape at (186, 72) with radius 39. Then Renders a green box of size 92x47 starting at (8, 87).
; PLAN: r0=186(x), r1=72(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=8(x), r1=87(y), r2=92(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a green circular shape at (186, 72) with radius 39.
; PLAN: r0=186(x), r1=72(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 72
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a green box of size 92x47 starting at (8, 87).
; PLAN: r0=8(x), r1=87(y), r2=92(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 87
LDI r2, 92
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
