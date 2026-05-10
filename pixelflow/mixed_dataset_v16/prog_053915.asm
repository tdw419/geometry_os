; DESCRIPTION: Renders a orange box of size 31x32 starting at (297, 147).
; PLAN: r0=297(x), r1=147(y), r2=31(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 147
LDI r2, 31
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
