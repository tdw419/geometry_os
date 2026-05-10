; DESCRIPTION: Renders a cyan rectangular region spanning 60 by 10 at (188, 73).
; PLAN: r0=188(x), r1=73(y), r2=60(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 73
LDI r2, 60
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
