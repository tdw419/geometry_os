; DESCRIPTION: Renders a cyan box of size 36x14 starting at (35, 46).
; PLAN: r0=35(x), r1=46(y), r2=36(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 46
LDI r2, 36
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
