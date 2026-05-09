; DESCRIPTION: Renders a green box of size 117x43 starting at (109, 113).
; PLAN: r0=109(x), r1=113(y), r2=117(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 113
LDI r2, 117
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
