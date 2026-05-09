; DESCRIPTION: Creates a cyan rectangular region at (10, 194) spanning 40 by 52 pixels.
; PLAN: r0=10(x), r1=194(y), r2=40(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 194
LDI r2, 40
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
