; DESCRIPTION: Renders a green box of size 50x117 starting at (286, 86).
; PLAN: r0=286(x), r1=86(y), r2=50(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 86
LDI r2, 50
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
