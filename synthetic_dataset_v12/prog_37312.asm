; DESCRIPTION: Renders a magenta box of size 83x17 starting at (207, 38).
; PLAN: r0=207(x), r1=38(y), r2=83(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 38
LDI r2, 83
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
