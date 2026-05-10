; DESCRIPTION: Creates a cyan rectangular region at (386, 34) spanning 30 by 116 pixels.
; PLAN: r0=386(x), r1=34(y), r2=30(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 34
LDI r2, 30
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
