; DESCRIPTION: Renders a green box of size 78x68 starting at (405, 137).
; PLAN: r0=405(x), r1=137(y), r2=78(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 137
LDI r2, 78
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
