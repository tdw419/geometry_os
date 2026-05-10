; DESCRIPTION: Renders a cyan rectangular region spanning 85 by 93 at (261, 28).
; PLAN: r0=261(x), r1=28(y), r2=85(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 28
LDI r2, 85
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
