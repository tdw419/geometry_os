; DESCRIPTION: Composite: . Then Renders a magenta disk with center (73, 163) and radius 61. Then Places a yellow 54x42 rectangle at position (53, 97).
; PLAN: r0=73(x), r1=163(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=53(x), r1=97(y), r2=54(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta disk with center (73, 163) and radius 61.
; PLAN: r0=73(x), r1=163(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 163
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow 54x42 rectangle at position (53, 97).
; PLAN: r0=53(x), r1=97(y), r2=54(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 97
LDI r2, 54
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
