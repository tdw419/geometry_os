; DESCRIPTION: Composite: . Then Places a white circle of radius 16 at center (135, 64). Then Renders a magenta box of size 34x119 starting at (209, 79).
; PLAN: r0=135(x), r1=64(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=209(x), r1=79(y), r2=34(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white circle of radius 16 at center (135, 64).
; PLAN: r0=135(x), r1=64(y), r2=16(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 64
LDI r2, 16
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a magenta box of size 34x119 starting at (209, 79).
; PLAN: r0=209(x), r1=79(y), r2=34(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 79
LDI r2, 34
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
