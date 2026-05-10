; DESCRIPTION: Renders a cyan rectangular region spanning 82 by 34 at (166, 65).
; PLAN: r0=166(x), r1=65(y), r2=82(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 65
LDI r2, 82
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
