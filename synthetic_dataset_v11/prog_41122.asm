; DESCRIPTION: Composite: . Then Creates a magenta rectangular region at (10, 165) spanning 78 by 47 pixels. Then Draws a yellow circle centered at (146, 71) with radius 32.
; PLAN: r0=10(x), r1=165(y), r2=78(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=146(x), r1=71(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Creates a magenta rectangular region at (10, 165) spanning 78 by 47 pixels.
; PLAN: r0=10(x), r1=165(y), r2=78(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 165
LDI r2, 78
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow circle centered at (146, 71) with radius 32.
; PLAN: r0=146(x), r1=71(y), r2=32(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 71
LDI r2, 32
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
