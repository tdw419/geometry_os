; DESCRIPTION: Renders a cyan box of size 69x120 starting at (302, 58).
; PLAN: r0=302(x), r1=58(y), r2=69(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 58
LDI r2, 69
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
