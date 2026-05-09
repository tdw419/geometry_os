; DESCRIPTION: Renders a yellow box of size 54x21 starting at (164, 13).
; PLAN: r0=164(x), r1=13(y), r2=54(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 13
LDI r2, 54
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
