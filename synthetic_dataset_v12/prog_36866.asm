; DESCRIPTION: Creates a cyan rectangular region at (56, 112) spanning 120 by 119 pixels.
; PLAN: r0=56(x), r1=112(y), r2=120(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 112
LDI r2, 120
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
