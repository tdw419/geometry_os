; DESCRIPTION: Creates a cyan rectangular region at (307, 29) spanning 96 by 39 pixels.
; PLAN: r0=307(x), r1=29(y), r2=96(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 29
LDI r2, 96
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
