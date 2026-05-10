; DESCRIPTION: Renders a cyan box of size 65x69 starting at (223, 116).
; PLAN: r0=223(x), r1=116(y), r2=65(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 116
LDI r2, 65
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
