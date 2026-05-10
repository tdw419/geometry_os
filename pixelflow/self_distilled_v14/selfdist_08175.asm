; DESCRIPTION: Renders a cyan rectangular region spanning 60 by 69 at (374, 191).
; PLAN: r0=374(x), r1=191(y), r2=60(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 191
LDI r2, 60
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
