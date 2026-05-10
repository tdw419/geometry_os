; DESCRIPTION: Renders a cyan rectangular region spanning 16 by 62 at (140, 151).
; PLAN: r0=140(x), r1=151(y), r2=16(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 151
LDI r2, 16
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
