; DESCRIPTION: Composite: . Then Renders a yellow box of size 90x44 starting at (25, 172). Then Renders a orange line between points (173, 161) and (43, 192).
; PLAN: r0=25(x), r1=172(y), r2=90(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=173(x1), r1=161(y1), r2=43(x2), r3=192(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow box of size 90x44 starting at (25, 172).
; PLAN: r0=25(x), r1=172(y), r2=90(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 172
LDI r2, 90
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange line between points (173, 161) and (43, 192).
; PLAN: r0=173(x1), r1=161(y1), r2=43(x2), r3=192(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 161
LDI r2, 43
LDI r3, 192
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
