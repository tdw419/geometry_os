; DESCRIPTION: Composite: . Then Draws a green circle centered at (168, 119) with radius 26. Then Draws a red rectangle at (73, 208) with width 87 and height 12.
; PLAN: r0=168(x), r1=119(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=73(x), r1=208(y), r2=87(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green circle centered at (168, 119) with radius 26.
; PLAN: r0=168(x), r1=119(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 119
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a red rectangle at (73, 208) with width 87 and height 12.
; PLAN: r0=73(x), r1=208(y), r2=87(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 208
LDI r2, 87
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
