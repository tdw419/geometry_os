; DESCRIPTION: Renders a yellow box of size 59x44 starting at (117, 166).
; PLAN: r0=117(x), r1=166(y), r2=59(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 166
LDI r2, 59
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
