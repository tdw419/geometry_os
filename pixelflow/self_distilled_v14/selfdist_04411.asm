; DESCRIPTION: Renders a cyan rectangular region spanning 92 by 101 at (103, 65).
; PLAN: r0=103(x), r1=65(y), r2=92(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 65
LDI r2, 92
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
