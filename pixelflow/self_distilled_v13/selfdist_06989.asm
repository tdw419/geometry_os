; DESCRIPTION: Renders a cyan rectangular region spanning 18 by 109 at (214, 145).
; PLAN: r0=214(x), r1=145(y), r2=18(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 145
LDI r2, 18
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
