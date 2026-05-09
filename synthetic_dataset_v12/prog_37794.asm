; DESCRIPTION: Creates a cyan rectangular region at (213, 0) spanning 59 by 66 pixels.
; PLAN: r0=213(x), r1=0(y), r2=59(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 0
LDI r2, 59
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
