; DESCRIPTION: Renders a green box of size 54x30 starting at (162, 77).
; PLAN: r0=162(x), r1=77(y), r2=54(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 77
LDI r2, 54
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
