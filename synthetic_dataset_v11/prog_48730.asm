; DESCRIPTION: Renders a cyan box of size 59x73 starting at (108, 65).
; PLAN: r0=108(x), r1=65(y), r2=59(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 65
LDI r2, 59
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
