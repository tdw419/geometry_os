; DESCRIPTION: Composite: . Then Renders a magenta box of size 12x112 starting at (184, 43). Then Creates a green circular shape at (157, 125) with radius 80.
; PLAN: r0=184(x), r1=43(y), r2=12(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=157(x), r1=125(y), r2=80(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a magenta box of size 12x112 starting at (184, 43).
; PLAN: r0=184(x), r1=43(y), r2=12(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 43
LDI r2, 12
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a green circular shape at (157, 125) with radius 80.
; PLAN: r0=157(x), r1=125(y), r2=80(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 125
LDI r2, 80
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
