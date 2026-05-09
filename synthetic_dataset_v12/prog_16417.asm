; DESCRIPTION: Creates a cyan rectangular region at (292, 180) spanning 70 by 28 pixels.
; PLAN: r0=292(x), r1=180(y), r2=70(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 180
LDI r2, 70
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
