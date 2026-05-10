; DESCRIPTION: Renders a red rectangular region spanning 45 by 97 at (386, 131).
; PLAN: r0=386(x), r1=131(y), r2=45(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 131
LDI r2, 45
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
