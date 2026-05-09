; DESCRIPTION: Creates a cyan rectangular region at (113, 124) spanning 107 by 43 pixels.
; PLAN: r0=113(x), r1=124(y), r2=107(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 124
LDI r2, 107
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
