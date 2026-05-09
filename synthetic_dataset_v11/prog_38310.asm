; DESCRIPTION: Renders a green box of size 85x36 starting at (103, 28).
; PLAN: r0=103(x), r1=28(y), r2=85(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 28
LDI r2, 85
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
