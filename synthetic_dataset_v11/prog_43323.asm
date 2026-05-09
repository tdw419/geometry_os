; DESCRIPTION: Composite: . Then Renders a purple box of size 46x107 starting at (127, 143). Then Places a orange circle of radius 57 at center (114, 85).
; PLAN: r0=127(x), r1=143(y), r2=46(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=114(x), r1=85(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a purple box of size 46x107 starting at (127, 143).
; PLAN: r0=127(x), r1=143(y), r2=46(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 143
LDI r2, 46
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange circle of radius 57 at center (114, 85).
; PLAN: r0=114(x), r1=85(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 85
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
