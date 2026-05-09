; DESCRIPTION: Renders a green box of size 39x60 starting at (10, 7).
; PLAN: r0=10(x), r1=7(y), r2=39(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 7
LDI r2, 39
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
