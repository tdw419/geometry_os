; DESCRIPTION: Creates a cyan rectangular region at (105, 53) spanning 109 by 77 pixels.
; PLAN: r0=105(x), r1=53(y), r2=109(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 53
LDI r2, 109
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
