; DESCRIPTION: Renders a white box of size 36x59 starting at (302, 54).
; PLAN: r0=302(x), r1=54(y), r2=36(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 54
LDI r2, 36
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
