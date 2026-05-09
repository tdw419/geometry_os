; DESCRIPTION: Renders a white box of size 83x74 starting at (154, 83).
; PLAN: r0=154(x), r1=83(y), r2=83(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 83
LDI r2, 83
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
