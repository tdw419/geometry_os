; DESCRIPTION: Creates a cyan rectangular region at (77, 2) spanning 110 by 50 pixels.
; PLAN: r0=77(x), r1=2(y), r2=110(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 2
LDI r2, 110
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
