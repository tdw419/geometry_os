; DESCRIPTION: Composite: . Then Places a green 105x68 rectangle at position (93, 138). Then Draws a white circle centered at (90, 98) with radius 79.
; PLAN: r0=93(x), r1=138(y), r2=105(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=90(x), r1=98(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green 105x68 rectangle at position (93, 138).
; PLAN: r0=93(x), r1=138(y), r2=105(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 138
LDI r2, 105
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white circle centered at (90, 98) with radius 79.
; PLAN: r0=90(x), r1=98(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 98
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
