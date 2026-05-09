; DESCRIPTION: Creates a cyan rectangular region at (7, 25) spanning 109 by 53 pixels.
; PLAN: r0=7(x), r1=25(y), r2=109(width), r3=53(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 25
LDI r2, 109
LDI r3, 53
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
