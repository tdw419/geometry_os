; DESCRIPTION: Renders a cyan box of size 62x92 starting at (95, 100).
; PLAN: r0=95(x), r1=100(y), r2=62(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 100
LDI r2, 62
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
