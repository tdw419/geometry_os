; DESCRIPTION: Renders a green box of size 89x114 starting at (305, 54).
; PLAN: r0=305(x), r1=54(y), r2=89(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 54
LDI r2, 89
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
