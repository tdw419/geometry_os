; DESCRIPTION: Creates a cyan rectangular region at (446, 20) spanning 26 by 98 pixels.
; PLAN: r0=446(x), r1=20(y), r2=26(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 20
LDI r2, 26
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
