; DESCRIPTION: Composite: . Then Places a black circle of radius 60 at center (180, 144). Then Creates a green rectangular region at (12, 42) spanning 91 by 37 pixels.
; PLAN: r0=180(x), r1=144(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=12(x), r1=42(y), r2=91(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black circle of radius 60 at center (180, 144).
; PLAN: r0=180(x), r1=144(y), r2=60(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 144
LDI r2, 60
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Creates a green rectangular region at (12, 42) spanning 91 by 37 pixels.
; PLAN: r0=12(x), r1=42(y), r2=91(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 42
LDI r2, 91
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
