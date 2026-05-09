; DESCRIPTION: Creates a cyan rectangular region at (138, 100) spanning 16 by 80 pixels.
; PLAN: r0=138(x), r1=100(y), r2=16(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 100
LDI r2, 16
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
