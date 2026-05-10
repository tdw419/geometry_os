; DESCRIPTION: Creates a cyan rectangular region at (317, 23) spanning 36 by 14 pixels.
; PLAN: r0=317(x), r1=23(y), r2=36(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 23
LDI r2, 36
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
