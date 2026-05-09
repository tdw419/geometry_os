; DESCRIPTION: Composite: . Then Places a yellow circle of radius 66 at center (132, 135). Then Renders a yellow box of size 69x52 starting at (106, 111).
; PLAN: r0=132(x), r1=135(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=106(x), r1=111(y), r2=69(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow circle of radius 66 at center (132, 135).
; PLAN: r0=132(x), r1=135(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 135
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a yellow box of size 69x52 starting at (106, 111).
; PLAN: r0=106(x), r1=111(y), r2=69(width), r3=52(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 111
LDI r2, 69
LDI r3, 52
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
