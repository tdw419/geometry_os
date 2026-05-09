; DESCRIPTION: Renders a green box of size 28x43 starting at (99, 120).
; PLAN: r0=99(x), r1=120(y), r2=28(width), r3=43(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 120
LDI r2, 28
LDI r3, 43
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
