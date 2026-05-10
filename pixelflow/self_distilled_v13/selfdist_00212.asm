; DESCRIPTION: Renders a cyan rectangular region spanning 108 by 69 at (91, 131).
; PLAN: r0=91(x), r1=131(y), r2=108(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 131
LDI r2, 108
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
