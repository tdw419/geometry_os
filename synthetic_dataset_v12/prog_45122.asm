; DESCRIPTION: Renders a white box of size 15x16 starting at (312, 187).
; PLAN: r0=312(x), r1=187(y), r2=15(width), r3=16(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 187
LDI r2, 15
LDI r3, 16
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
