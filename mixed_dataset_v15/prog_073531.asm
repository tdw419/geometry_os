; DESCRIPTION: Renders a cyan rectangular region spanning 39 by 18 at (29, 169).
; PLAN: r0=29(x), r1=169(y), r2=39(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 169
LDI r2, 39
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
