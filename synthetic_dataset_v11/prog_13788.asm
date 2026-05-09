; DESCRIPTION: Creates a cyan rectangular region at (60, 32) spanning 38 by 91 pixels.
; PLAN: r0=60(x), r1=32(y), r2=38(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 32
LDI r2, 38
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
