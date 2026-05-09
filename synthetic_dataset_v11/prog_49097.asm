; DESCRIPTION: Composite: . Then Renders a magenta disk with center (108, 121) and radius 72. Then Places a red 35x87 rectangle at position (105, 165).
; PLAN: r0=108(x), r1=121(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=105(x), r1=165(y), r2=35(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a magenta disk with center (108, 121) and radius 72.
; PLAN: r0=108(x), r1=121(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 121
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red 35x87 rectangle at position (105, 165).
; PLAN: r0=105(x), r1=165(y), r2=35(width), r3=87(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 165
LDI r2, 35
LDI r3, 87
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
