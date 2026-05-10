; DESCRIPTION: Renders a white box of size 94x46 starting at (154, 10).
; PLAN: r0=154(x), r1=10(y), r2=94(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 10
LDI r2, 94
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
