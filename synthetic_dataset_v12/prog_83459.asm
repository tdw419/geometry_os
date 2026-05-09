; DESCRIPTION: Renders a orange box of size 95x103 starting at (235, 70).
; PLAN: r0=235(x), r1=70(y), r2=95(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 70
LDI r2, 95
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
