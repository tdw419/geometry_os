; DESCRIPTION: Renders a green box of size 54x100 starting at (80, 98).
; PLAN: r0=80(x), r1=98(y), r2=54(width), r3=100(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 98
LDI r2, 54
LDI r3, 100
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
