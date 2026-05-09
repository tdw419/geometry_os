; DESCRIPTION: Composite: . Then Renders a yellow box of size 51x108 starting at (16, 82). Then Renders a magenta disk with center (70, 187) and radius 27.
; PLAN: r0=16(x), r1=82(y), r2=51(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=70(x), r1=187(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a yellow box of size 51x108 starting at (16, 82).
; PLAN: r0=16(x), r1=82(y), r2=51(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 82
LDI r2, 51
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta disk with center (70, 187) and radius 27.
; PLAN: r0=70(x), r1=187(y), r2=27(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 187
LDI r2, 27
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
