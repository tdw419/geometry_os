; DESCRIPTION: Creates a cyan rectangular region at (36, 171) spanning 80 by 50 pixels.
; PLAN: r0=36(x), r1=171(y), r2=80(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 171
LDI r2, 80
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
