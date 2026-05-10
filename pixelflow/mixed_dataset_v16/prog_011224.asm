; DESCRIPTION: Creates a cyan rectangular region at (18, 111) spanning 16 by 26 pixels.
; PLAN: r0=18(x), r1=111(y), r2=16(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 111
LDI r2, 16
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
