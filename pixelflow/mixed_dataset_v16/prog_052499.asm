; DESCRIPTION: Creates a cyan rectangular region at (158, 180) spanning 20 by 71 pixels.
; PLAN: r0=158(x), r1=180(y), r2=20(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 180
LDI r2, 20
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
