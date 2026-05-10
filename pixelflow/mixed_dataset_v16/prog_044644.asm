; DESCRIPTION: Creates a cyan rectangular region at (82, 45) spanning 77 by 69 pixels.
; PLAN: r0=82(x), r1=45(y), r2=77(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 45
LDI r2, 77
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
