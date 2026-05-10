; DESCRIPTION: Renders a cyan rectangular region spanning 82 by 108 at (299, 40).
; PLAN: r0=299(x), r1=40(y), r2=82(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 40
LDI r2, 82
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
