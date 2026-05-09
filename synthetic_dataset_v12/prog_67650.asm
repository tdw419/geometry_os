; DESCRIPTION: Renders a white box of size 47x68 starting at (214, 83).
; PLAN: r0=214(x), r1=83(y), r2=47(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 83
LDI r2, 47
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
