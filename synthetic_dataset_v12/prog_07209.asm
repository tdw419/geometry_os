; DESCRIPTION: Creates a cyan rectangular region at (226, 112) spanning 44 by 111 pixels.
; PLAN: r0=226(x), r1=112(y), r2=44(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 112
LDI r2, 44
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
