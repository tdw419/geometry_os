; DESCRIPTION: Creates a cyan rectangular region at (350, 6) spanning 110 by 120 pixels.
; PLAN: r0=350(x), r1=6(y), r2=110(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 6
LDI r2, 110
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
