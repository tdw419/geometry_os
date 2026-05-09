; DESCRIPTION: Renders a green box of size 99x120 starting at (121, 79).
; PLAN: r0=121(x), r1=79(y), r2=99(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 79
LDI r2, 99
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
