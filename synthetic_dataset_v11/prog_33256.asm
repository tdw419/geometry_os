; DESCRIPTION: Composite: . Then Renders a magenta box of size 42x79 starting at (21, 4). Then Creates a magenta circular shape at (144, 198) with radius 54.
; PLAN: r0=21(x), r1=4(y), r2=42(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=144(x), r1=198(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a magenta box of size 42x79 starting at (21, 4).
; PLAN: r0=21(x), r1=4(y), r2=42(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 4
LDI r2, 42
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a magenta circular shape at (144, 198) with radius 54.
; PLAN: r0=144(x), r1=198(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 198
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
