; DESCRIPTION: Renders a cyan rectangular region spanning 56 by 75 at (368, 164).
; PLAN: r0=368(x), r1=164(y), r2=56(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 164
LDI r2, 56
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
