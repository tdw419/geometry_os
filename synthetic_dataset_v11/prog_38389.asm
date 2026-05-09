; DESCRIPTION: Creates a cyan rectangular region at (179, 96) spanning 28 by 59 pixels.
; PLAN: r0=179(x), r1=96(y), r2=28(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 96
LDI r2, 28
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
