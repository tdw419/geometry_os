; DESCRIPTION: Composite: . Then Places a red 107x60 rectangle at position (55, 91). Then Renders a orange disk with center (171, 132) and radius 74.
; PLAN: r0=55(x), r1=91(y), r2=107(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=171(x), r1=132(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red 107x60 rectangle at position (55, 91).
; PLAN: r0=55(x), r1=91(y), r2=107(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 91
LDI r2, 107
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange disk with center (171, 132) and radius 74.
; PLAN: r0=171(x), r1=132(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 132
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
