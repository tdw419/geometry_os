; DESCRIPTION: Composite: . Then Places a green dot at position (181, 173). Then Renders a black box of size 115x34 starting at (75, 70).
; PLAN: r0=181(x), r1=173(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=75(x), r1=70(y), r2=115(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green dot at position (181, 173).
; PLAN: r0=181(x), r1=173(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 181
LDI r1, 173
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Renders a black box of size 115x34 starting at (75, 70).
; PLAN: r0=75(x), r1=70(y), r2=115(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 70
LDI r2, 115
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
