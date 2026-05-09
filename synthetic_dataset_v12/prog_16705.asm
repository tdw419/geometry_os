; DESCRIPTION: Renders a red box of size 107x109 starting at (87, 110).
; PLAN: r0=87(x), r1=110(y), r2=107(width), r3=109(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 110
LDI r2, 107
LDI r3, 109
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
