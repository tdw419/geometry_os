; DESCRIPTION: Creates a cyan rectangular region at (221, 74) spanning 75 by 90 pixels.
; PLAN: r0=221(x), r1=74(y), r2=75(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 74
LDI r2, 75
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
