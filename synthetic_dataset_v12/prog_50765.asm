; DESCRIPTION: Creates a cyan rectangular region at (202, 90) spanning 43 by 120 pixels.
; PLAN: r0=202(x), r1=90(y), r2=43(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 90
LDI r2, 43
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
