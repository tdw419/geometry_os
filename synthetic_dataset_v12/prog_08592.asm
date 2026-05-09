; DESCRIPTION: Creates a cyan rectangular region at (408, 120) spanning 96 by 110 pixels.
; PLAN: r0=408(x), r1=120(y), r2=96(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 120
LDI r2, 96
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
