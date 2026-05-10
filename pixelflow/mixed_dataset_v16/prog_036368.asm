; DESCRIPTION: Places a yellow 44x100 rectangle at position (306, 40).
; PLAN: r0=306(x), r1=40(y), r2=44(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 40
LDI r2, 44
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
