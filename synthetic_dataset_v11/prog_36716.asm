; DESCRIPTION: Creates a cyan rectangular region at (10, 130) spanning 82 by 76 pixels.
; PLAN: r0=10(x), r1=130(y), r2=82(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 130
LDI r2, 82
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
