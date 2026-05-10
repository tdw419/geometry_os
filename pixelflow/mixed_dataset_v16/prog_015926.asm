; DESCRIPTION: Renders a cyan box of size 69x99 starting at (314, 48).
; PLAN: r0=314(x), r1=48(y), r2=69(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 48
LDI r2, 69
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
