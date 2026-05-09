; DESCRIPTION: Creates a cyan rectangular region at (179, 60) spanning 76 by 28 pixels.
; PLAN: r0=179(x), r1=60(y), r2=76(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 60
LDI r2, 76
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
