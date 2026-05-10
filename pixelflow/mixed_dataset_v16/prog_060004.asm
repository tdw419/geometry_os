; DESCRIPTION: Renders a cyan box of size 54x92 starting at (149, 80).
; PLAN: r0=149(x), r1=80(y), r2=54(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 80
LDI r2, 54
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
