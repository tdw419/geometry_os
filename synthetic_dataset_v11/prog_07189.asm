; DESCRIPTION: Renders a green box of size 47x60 starting at (138, 10).
; PLAN: r0=138(x), r1=10(y), r2=47(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 10
LDI r2, 47
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
