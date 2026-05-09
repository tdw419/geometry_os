; DESCRIPTION: Renders a green box of size 113x59 starting at (399, 40).
; PLAN: r0=399(x), r1=40(y), r2=113(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 40
LDI r2, 113
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
