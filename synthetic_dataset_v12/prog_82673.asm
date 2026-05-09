; DESCRIPTION: Creates a cyan rectangular region at (5, 95) spanning 77 by 49 pixels.
; PLAN: r0=5(x), r1=95(y), r2=77(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 95
LDI r2, 77
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
