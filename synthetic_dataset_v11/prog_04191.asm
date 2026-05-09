; DESCRIPTION: Creates a cyan rectangular region at (148, 194) spanning 96 by 19 pixels.
; PLAN: r0=148(x), r1=194(y), r2=96(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 194
LDI r2, 96
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
