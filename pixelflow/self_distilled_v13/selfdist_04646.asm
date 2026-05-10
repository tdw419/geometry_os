; DESCRIPTION: Renders a cyan rectangular region spanning 113 by 52 at (3, 108).
; PLAN: r0=3(x), r1=108(y), r2=113(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 108
LDI r2, 113
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
