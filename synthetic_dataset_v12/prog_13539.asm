; DESCRIPTION: Creates a cyan rectangular region at (59, 44) spanning 74 by 49 pixels.
; PLAN: r0=59(x), r1=44(y), r2=74(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 44
LDI r2, 74
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
