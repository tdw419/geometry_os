; DESCRIPTION: Creates a cyan rectangular region at (267, 218) spanning 71 by 30 pixels.
; PLAN: r0=267(x), r1=218(y), r2=71(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 218
LDI r2, 71
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
