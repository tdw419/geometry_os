; DESCRIPTION: Renders a cyan rectangular region spanning 12 by 30 at (164, 56).
; PLAN: r0=164(x), r1=56(y), r2=12(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 56
LDI r2, 12
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
