; DESCRIPTION: Renders a green box of size 86x22 starting at (91, 21).
; PLAN: r0=91(x), r1=21(y), r2=86(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 21
LDI r2, 86
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
