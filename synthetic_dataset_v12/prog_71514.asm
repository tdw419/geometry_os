; DESCRIPTION: Renders a white box of size 23x103 starting at (236, 85).
; PLAN: r0=236(x), r1=85(y), r2=23(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 85
LDI r2, 23
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
