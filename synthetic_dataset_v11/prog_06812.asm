; DESCRIPTION: Composite: . Then Draws a white circle centered at (149, 40) with radius 23. Then Renders a cyan box of size 18x85 starting at (164, 58).
; PLAN: r0=149(x), r1=40(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=164(x), r1=58(y), r2=18(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white circle centered at (149, 40) with radius 23.
; PLAN: r0=149(x), r1=40(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 40
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a cyan box of size 18x85 starting at (164, 58).
; PLAN: r0=164(x), r1=58(y), r2=18(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 58
LDI r2, 18
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
