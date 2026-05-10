; DESCRIPTION: Renders a white box of size 54x118 starting at (305, 46).
; PLAN: r0=305(x), r1=46(y), r2=54(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 46
LDI r2, 54
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
