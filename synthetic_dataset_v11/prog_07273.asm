; DESCRIPTION: Composite: . Then Renders a orange disk with center (144, 116) and radius 67. Then Draws a cyan line from (164, 5) to (110, 155).
; PLAN: r0=144(x), r1=116(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=164(x1), r1=5(y1), r2=110(x2), r3=155(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange disk with center (144, 116) and radius 67.
; PLAN: r0=144(x), r1=116(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 116
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a cyan line from (164, 5) to (110, 155).
; PLAN: r0=164(x1), r1=5(y1), r2=110(x2), r3=155(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 5
LDI r2, 110
LDI r3, 155
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
