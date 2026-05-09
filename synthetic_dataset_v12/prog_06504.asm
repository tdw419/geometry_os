; DESCRIPTION: Renders a white box of size 86x111 starting at (91, 123).
; PLAN: r0=91(x), r1=123(y), r2=86(width), r3=111(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 123
LDI r2, 86
LDI r3, 111
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
