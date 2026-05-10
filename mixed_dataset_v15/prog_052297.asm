; DESCRIPTION: Renders a cyan box of size 70x11 starting at (302, 87).
; PLAN: r0=302(x), r1=87(y), r2=70(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 87
LDI r2, 70
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
