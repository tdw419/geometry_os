; DESCRIPTION: Renders a orange box of size 15x113 starting at (235, 98).
; PLAN: r0=235(x), r1=98(y), r2=15(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 98
LDI r2, 15
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
