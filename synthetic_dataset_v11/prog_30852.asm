; DESCRIPTION: Renders a cyan box of size 54x92 starting at (62, 135).
; PLAN: r0=62(x), r1=135(y), r2=54(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 135
LDI r2, 54
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
