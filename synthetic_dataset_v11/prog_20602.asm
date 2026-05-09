; DESCRIPTION: Renders a yellow box of size 13x91 starting at (210, 30).
; PLAN: r0=210(x), r1=30(y), r2=13(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 30
LDI r2, 13
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
