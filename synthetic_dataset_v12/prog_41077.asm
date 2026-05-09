; DESCRIPTION: Renders a white box of size 108x31 starting at (154, 7).
; PLAN: r0=154(x), r1=7(y), r2=108(width), r3=31(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 7
LDI r2, 108
LDI r3, 31
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
