; DESCRIPTION: Renders a green box of size 48x28 starting at (221, 76).
; PLAN: r0=221(x), r1=76(y), r2=48(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 76
LDI r2, 48
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
