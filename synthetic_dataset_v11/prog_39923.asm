; DESCRIPTION: Renders a cyan box of size 117x55 starting at (108, 163).
; PLAN: r0=108(x), r1=163(y), r2=117(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 163
LDI r2, 117
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
