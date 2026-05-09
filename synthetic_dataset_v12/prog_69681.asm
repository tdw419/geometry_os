; DESCRIPTION: Creates a cyan rectangular region at (317, 1) spanning 71 by 116 pixels.
; PLAN: r0=317(x), r1=1(y), r2=71(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 1
LDI r2, 71
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
