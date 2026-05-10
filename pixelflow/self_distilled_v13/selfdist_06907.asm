; DESCRIPTION: Renders a cyan rectangular region spanning 56 by 93 at (12, 121).
; PLAN: r0=12(x), r1=121(y), r2=56(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 121
LDI r2, 56
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
