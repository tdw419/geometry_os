; DESCRIPTION: Renders a green box of size 111x56 starting at (353, 39).
; PLAN: r0=353(x), r1=39(y), r2=111(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 39
LDI r2, 111
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
