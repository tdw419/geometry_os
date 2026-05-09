; DESCRIPTION: Composite: . Then Renders a green box of size 69x33 starting at (121, 75). Then Places a cyan circle of radius 74 at center (125, 181).
; PLAN: r0=121(x), r1=75(y), r2=69(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=125(x), r1=181(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a green box of size 69x33 starting at (121, 75).
; PLAN: r0=121(x), r1=75(y), r2=69(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 75
LDI r2, 69
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a cyan circle of radius 74 at center (125, 181).
; PLAN: r0=125(x), r1=181(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 181
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
