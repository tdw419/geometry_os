; DESCRIPTION: Renders a green box of size 117x57 starting at (165, 2).
; PLAN: r0=165(x), r1=2(y), r2=117(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 2
LDI r2, 117
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
