; DESCRIPTION: Renders a cyan rectangular region spanning 87 by 21 at (146, 1).
; PLAN: r0=146(x), r1=1(y), r2=87(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 1
LDI r2, 87
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
