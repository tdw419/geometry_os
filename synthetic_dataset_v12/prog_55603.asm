; DESCRIPTION: Creates a red rectangular region at (406, 124) spanning 54 by 64 pixels.
; PLAN: r0=406(x), r1=124(y), r2=54(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 124
LDI r2, 54
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
