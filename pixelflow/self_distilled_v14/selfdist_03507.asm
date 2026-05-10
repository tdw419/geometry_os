; DESCRIPTION: Renders a cyan rectangular region spanning 11 by 55 at (385, 93).
; PLAN: r0=385(x), r1=93(y), r2=11(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 93
LDI r2, 11
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
