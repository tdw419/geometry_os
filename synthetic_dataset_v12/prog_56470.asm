; DESCRIPTION: Renders a black box of size 27x16 starting at (302, 13).
; PLAN: r0=302(x), r1=13(y), r2=27(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 13
LDI r2, 27
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
