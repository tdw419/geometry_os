; DESCRIPTION: Renders a green box of size 72x11 starting at (421, 44).
; PLAN: r0=421(x), r1=44(y), r2=72(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 44
LDI r2, 72
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
