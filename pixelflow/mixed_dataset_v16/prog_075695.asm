; DESCRIPTION: Renders a cyan rectangular region spanning 65 by 47 at (85, 84).
; PLAN: r0=85(x), r1=84(y), r2=65(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 84
LDI r2, 65
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
