; DESCRIPTION: Renders a green box of size 28x34 starting at (121, 150).
; PLAN: r0=121(x), r1=150(y), r2=28(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 150
LDI r2, 28
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
