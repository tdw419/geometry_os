; DESCRIPTION: Creates a cyan rectangular region at (113, 24) spanning 107 by 106 pixels.
; PLAN: r0=113(x), r1=24(y), r2=107(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 24
LDI r2, 107
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
