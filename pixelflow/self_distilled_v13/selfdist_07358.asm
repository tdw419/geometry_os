; DESCRIPTION: Renders a cyan rectangular region spanning 44 by 18 at (35, 117).
; PLAN: r0=35(x), r1=117(y), r2=44(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 117
LDI r2, 44
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
