; DESCRIPTION: Creates a cyan rectangular region at (29, 73) spanning 106 by 120 pixels.
; PLAN: r0=29(x), r1=73(y), r2=106(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 73
LDI r2, 106
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
