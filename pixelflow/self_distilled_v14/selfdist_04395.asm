; DESCRIPTION: Renders a cyan rectangular region spanning 16 by 16 at (100, 135).
; PLAN: r0=100(x), r1=135(y), r2=16(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 135
LDI r2, 16
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
