; DESCRIPTION: Renders a yellow box of size 54x113 starting at (29, 54).
; PLAN: r0=29(x), r1=54(y), r2=54(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 54
LDI r2, 54
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
