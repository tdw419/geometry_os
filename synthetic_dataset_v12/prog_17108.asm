; DESCRIPTION: Places a yellow 70x91 rectangle at position (20, 78).
; PLAN: r0=20(x), r1=78(y), r2=70(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 78
LDI r2, 70
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
