; DESCRIPTION: Renders a cyan box of size 99x91 starting at (221, 69).
; PLAN: r0=221(x), r1=69(y), r2=99(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 69
LDI r2, 99
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
