; DESCRIPTION: Composite: . Then Places a orange circle of radius 74 at center (171, 128). Then Renders a purple box of size 25x27 starting at (187, 147).
; PLAN: r0=171(x), r1=128(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=187(x), r1=147(y), r2=25(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange circle of radius 74 at center (171, 128).
; PLAN: r0=171(x), r1=128(y), r2=74(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 128
LDI r2, 74
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Renders a purple box of size 25x27 starting at (187, 147).
; PLAN: r0=187(x), r1=147(y), r2=25(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 147
LDI r2, 25
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
