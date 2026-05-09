; DESCRIPTION: Renders a green box of size 55x19 starting at (18, 86).
; PLAN: r0=18(x), r1=86(y), r2=55(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 86
LDI r2, 55
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
