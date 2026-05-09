; DESCRIPTION: Renders a cyan box of size 95x110 starting at (235, 28).
; PLAN: r0=235(x), r1=28(y), r2=95(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 28
LDI r2, 95
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
