; DESCRIPTION: Renders a yellow box of size 90x47 starting at (40, 86).
; PLAN: r0=40(x), r1=86(y), r2=90(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 86
LDI r2, 90
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
