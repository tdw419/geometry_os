; DESCRIPTION: Composite: . Then Renders a black box of size 36x33 starting at (209, 128). Then Places a yellow line segment connecting (130, 125) to (87, 100).
; PLAN: r0=209(x), r1=128(y), r2=36(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=130(x1), r1=125(y1), r2=87(x2), r3=100(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black box of size 36x33 starting at (209, 128).
; PLAN: r0=209(x), r1=128(y), r2=36(width), r3=33(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 128
LDI r2, 36
LDI r3, 33
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow line segment connecting (130, 125) to (87, 100).
; PLAN: r0=130(x1), r1=125(y1), r2=87(x2), r3=100(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 125
LDI r2, 87
LDI r3, 100
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
