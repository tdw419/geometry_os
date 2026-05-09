; DESCRIPTION: Renders a red box of size 65x37 starting at (60, 91).
; PLAN: r0=60(x), r1=91(y), r2=65(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 91
LDI r2, 65
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
