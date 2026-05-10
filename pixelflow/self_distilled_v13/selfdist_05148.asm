; DESCRIPTION: Renders a cyan rectangular region spanning 20 by 25 at (244, 56).
; PLAN: r0=244(x), r1=56(y), r2=20(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 56
LDI r2, 20
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
