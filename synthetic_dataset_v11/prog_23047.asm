; DESCRIPTION: Composite: . Then Renders a purple box of size 27x23 starting at (18, 83). Then Places a yellow circle of radius 77 at center (157, 89).
; PLAN: r0=18(x), r1=83(y), r2=27(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=157(x), r1=89(y), r2=77(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a purple box of size 27x23 starting at (18, 83).
; PLAN: r0=18(x), r1=83(y), r2=27(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 83
LDI r2, 27
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow circle of radius 77 at center (157, 89).
; PLAN: r0=157(x), r1=89(y), r2=77(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 89
LDI r2, 77
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
