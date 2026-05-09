; DESCRIPTION: Renders a cyan box of size 102x54 starting at (92, 65).
; PLAN: r0=92(x), r1=65(y), r2=102(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 65
LDI r2, 102
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
