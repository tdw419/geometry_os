; DESCRIPTION: Creates a cyan rectangular region at (359, 171) spanning 103 by 36 pixels.
; PLAN: r0=359(x), r1=171(y), r2=103(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 171
LDI r2, 103
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
