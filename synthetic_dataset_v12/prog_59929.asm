; DESCRIPTION: Creates a cyan rectangular region at (103, 12) spanning 71 by 37 pixels.
; PLAN: r0=103(x), r1=12(y), r2=71(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 12
LDI r2, 71
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
