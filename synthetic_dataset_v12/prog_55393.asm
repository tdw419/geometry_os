; DESCRIPTION: Creates a cyan rectangular region at (305, 102) spanning 36 by 111 pixels.
; PLAN: r0=305(x), r1=102(y), r2=36(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 102
LDI r2, 36
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
