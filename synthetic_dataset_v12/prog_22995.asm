; DESCRIPTION: Renders a yellow box of size 39x75 starting at (370, 86).
; PLAN: r0=370(x), r1=86(y), r2=39(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 86
LDI r2, 39
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
