; DESCRIPTION: Renders a red box of size 120x110 starting at (14, 91).
; PLAN: r0=14(x), r1=91(y), r2=120(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 91
LDI r2, 120
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
