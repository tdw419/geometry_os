; DESCRIPTION: Renders a red box of size 115x16 starting at (350, 89).
; PLAN: r0=350(x), r1=89(y), r2=115(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 89
LDI r2, 115
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
