; DESCRIPTION: Renders a cyan rectangular region spanning 60 by 93 at (131, 70).
; PLAN: r0=131(x), r1=70(y), r2=60(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 70
LDI r2, 60
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
