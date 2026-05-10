; DESCRIPTION: Renders a red box of size 106x65 starting at (235, 110).
; PLAN: r0=235(x), r1=110(y), r2=106(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 110
LDI r2, 106
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
