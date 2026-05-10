; DESCRIPTION: Renders a cyan rectangular region spanning 22 by 108 at (167, 136).
; PLAN: r0=167(x), r1=136(y), r2=22(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 136
LDI r2, 22
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
