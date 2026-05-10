; DESCRIPTION: Renders a green box of size 17x47 starting at (267, 160).
; PLAN: r0=267(x), r1=160(y), r2=17(width), r3=47(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 160
LDI r2, 17
LDI r3, 47
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
