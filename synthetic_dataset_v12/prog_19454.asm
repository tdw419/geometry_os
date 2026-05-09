; DESCRIPTION: Creates a cyan rectangular region at (387, 102) spanning 46 by 113 pixels.
; PLAN: r0=387(x), r1=102(y), r2=46(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 102
LDI r2, 46
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
