; DESCRIPTION: Renders a green box of size 99x48 starting at (215, 181).
; PLAN: r0=215(x), r1=181(y), r2=99(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 181
LDI r2, 99
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
