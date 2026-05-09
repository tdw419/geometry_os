; DESCRIPTION: Renders a cyan box of size 23x54 starting at (55, 46).
; PLAN: r0=55(x), r1=46(y), r2=23(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 46
LDI r2, 23
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
