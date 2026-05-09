; DESCRIPTION: Creates a cyan rectangular region at (286, 60) spanning 96 by 30 pixels.
; PLAN: r0=286(x), r1=60(y), r2=96(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 60
LDI r2, 96
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
