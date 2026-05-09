; DESCRIPTION: Renders a green box of size 71x103 starting at (408, 97).
; PLAN: r0=408(x), r1=97(y), r2=71(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 97
LDI r2, 71
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
