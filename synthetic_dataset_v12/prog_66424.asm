; DESCRIPTION: Renders a cyan box of size 85x109 starting at (235, 10).
; PLAN: r0=235(x), r1=10(y), r2=85(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 10
LDI r2, 85
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
