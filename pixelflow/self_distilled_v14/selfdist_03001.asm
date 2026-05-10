; DESCRIPTION: Renders a cyan rectangular region spanning 116 by 12 at (301, 20).
; PLAN: r0=301(x), r1=20(y), r2=116(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 20
LDI r2, 116
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
