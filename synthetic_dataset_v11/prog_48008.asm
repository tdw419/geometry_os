; DESCRIPTION: Composite: . Then Renders a orange box of size 24x85 starting at (86, 128). Then Places a white line segment connecting (90, 138) to (15, 99).
; PLAN: r0=86(x), r1=128(y), r2=24(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=90(x1), r1=138(y1), r2=15(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange box of size 24x85 starting at (86, 128).
; PLAN: r0=86(x), r1=128(y), r2=24(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 128
LDI r2, 24
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a white line segment connecting (90, 138) to (15, 99).
; PLAN: r0=90(x1), r1=138(y1), r2=15(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 138
LDI r2, 15
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
