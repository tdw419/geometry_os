; DESCRIPTION: Creates a red rectangular region at (322, 146) spanning 97 by 44 pixels.
; PLAN: r0=322(x), r1=146(y), r2=97(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 146
LDI r2, 97
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
