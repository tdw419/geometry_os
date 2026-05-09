; DESCRIPTION: Composite: . Then Places a orange circle of radius 41 at center (47, 143). Then Places a blue 95x36 rectangle at position (39, 65).
; PLAN: r0=47(x), r1=143(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=39(x), r1=65(y), r2=95(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange circle of radius 41 at center (47, 143).
; PLAN: r0=47(x), r1=143(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 47
LDI r1, 143
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a blue 95x36 rectangle at position (39, 65).
; PLAN: r0=39(x), r1=65(y), r2=95(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 65
LDI r2, 95
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
